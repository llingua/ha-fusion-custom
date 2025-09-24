<script lang="ts">
	import { states, selectedLanguage, motion, barErrors, editMode, dashboard } from '$lib/Stores';
	import type { HassEntity } from 'home-assistant-js-websocket';
	import { onMount } from 'svelte';
	import { getName, getSelected } from '$lib/Utils';
	import { openModal } from 'svelte-modals';

	export let entity_id: string | undefined;
	export let math: string | undefined = undefined;
	export let name: string | undefined = undefined;
	export let id: number | undefined = undefined;

	// Nuova prop per determinare il contesto (sidebar o main)
	export let variant: 'sidebar' | 'main' = 'sidebar';
	export let size: 'compact' | 'medium' | 'large' = variant === 'sidebar' ? 'compact' : 'medium';

	let entity: HassEntity;
	let cache: { [id: number]: { [key: string]: number } } = {};
	let expression = 0;
	let mounted: boolean;

	const options = {
		style: 'percent' as 'decimal' | 'currency' | 'percent' | 'unit',
		maximumFractionDigits: 2
	};

	$: if (entity_id) entity = $states?.[entity_id];
	$: state = entity?.state;
	$: if (math && id) {
		cache[id] = {};
	}

	$: if (entity) {
		/**
		 * Compute `expression`, first check if cached
		 * value otherwise evaluate the math expression
		 */
		let key = `${state}_${math}`;
		if (id && cache?.[id]?.[key]) {
			expression = cache[id][key];
		} else {
			expression = evaluate(state, math) || 0;
		}
	}

	onMount(() => {
		// wait a second before adding transition
		setTimeout(() => (mounted = true), 1000);
	});

	/**
	 * Evaluates the math expression based on the provided state value
	 *
	 * @example
	 * applyMathExpression(5, "x*2");  // returns 10
	 */
	function evaluate(state: string, math: string | undefined) {
		if (!math || !id || math.trim() === 'x') return Number(state);

		// trim white space and use dots
		const format = math.trim().replace(',', '.');

		try {
			// evaluate math expression
			const func = new Function('x', `return ${format}`);
			const result = func(Number(state));
			if (typeof result === 'number') {
				cache[id] = cache[id] || {};
				cache[id][`${state}_${math}`] = result;

				// clear error
				if (id) delete $barErrors[id];
				return result;
			}
		} catch (error) {
			// store error
			const err = error instanceof Error;
			if (id) {
				$barErrors[id] = err ? error.message : 'An unexpected error occurred.';
			}
		}
	}

	// Stili dinamici basati su variant e size
	$: containerClass = `container ${variant} ${size}`;
	$: fontSize = size === 'compact' ? '0.9em' : size === 'medium' ? '1em' : '1.2em';

	// Gestione click per modalità edit
	function handleClick() {
		if ($editMode && variant === 'main' && id) {
			// Trova l'oggetto reale nel dashboard invece di crearne uno nuovo
			const sel = getSelected(id, $dashboard);
			if (sel) {
				openModal(() => import('$lib/Modal/BarConfig.svelte'), {
					sel
				});
			} else {
				console.error("❌ Impossibile trovare l'item con id:", id);
			}
		}
	}
</script>

<div
	class={containerClass}
	style:font-size={fontSize}
	on:click={handleClick}
	on:keydown
	role="button"
	tabindex="0"
>
	<div class="header">
		<div class="friendly-name overflow">{getName({ name }, entity)}</div>
		<div class="state">
			{Intl.NumberFormat($selectedLanguage, options).format(expression / 100)}
		</div>
	</div>

	<div class="bar">
		<div
			class="fill"
			style:transition={mounted ? `width ${$motion}ms ease` : 'none'}
			style:width="{Math.min(Math.max(expression, 0), 100)}%"
		></div>
	</div>

	<!-- Informazioni aggiuntive per il main -->
	{#if variant === 'main' && (size === 'medium' || size === 'large')}
		<div class="additional-info">
			{#if entity?.attributes?.unit_of_measurement}
				<span class="unit">{entity.attributes.unit_of_measurement}</span>
			{/if}
			{#if entity?.last_updated}
				<span class="last-updated">
					{new Date(entity.last_updated).toLocaleTimeString($selectedLanguage)}
				</span>
			{/if}
		</div>
	{/if}
</div>

<style>
	.container {
		text-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
		border-radius: 0.65rem;
		transition: all 200ms ease;
	}

	/* Stili per Sidebar */
	.container.sidebar {
		padding: var(--theme-sidebar-item-padding);
	}

	/* Stili per Main */
	.container.main {
		padding: 1rem;
		background-color: var(--theme-colors-card-background);
		border: var(--theme-colors-card-border);
		box-shadow: var(--theme-shadows-card);
	}

	.container.main:hover {
		transform: translateY(-2px);
		box-shadow: var(--theme-shadows-card-hover, 0 4px 12px rgba(0, 0, 0, 0.15));
	}

	/* Dimensioni */
	.container.compact {
		min-height: 3rem;
	}

	.container.medium {
		min-height: 4rem;
	}

	.container.large {
		min-height: 5rem;
	}

	.header {
		display: flex;
		justify-content: space-between;
		margin-bottom: 0.3em;
		align-items: center;
	}

	.friendly-name {
		overflow: hidden;
		flex-grow: 1;
		text-align: left;
		font-weight: 500;
	}

	.state {
		white-space: nowrap;
		margin-left: 0.5em;
		font-weight: 600;
		color: var(--theme-colors-primary);
	}

	.fill {
		min-height: 0.5em;
		background-color: rgb(255, 255, 255, 0.9);
	}

	.bar {
		position: relative;
		background-color: rgba(0, 0, 0, 0.3);
		border-radius: 0.225rem;
		overflow: hidden;
		width: 100%;
	}

	.additional-info {
		display: flex;
		justify-content: space-between;
		margin-top: 0.5em;
		font-size: 0.8em;
		opacity: 0.7;
	}

	.unit {
		font-weight: 500;
	}

	.last-updated {
		font-style: italic;
	}

	.overflow {
		white-space: nowrap;
		text-overflow: ellipsis;
		overflow: hidden;
	}

	/* Responsive */
	@media (max-width: 768px) {
		.container.main {
			padding: 0.8rem;
		}

		.additional-info {
			font-size: 0.75em;
		}
	}
</style>
