/-
  ĆWICZENIA 3 – zadania dla chętnych
  Kurs: „Wstęp do dowodzenia w Lean 4”, spotkanie 3
-/

import Mathlib

open Filter Topology   -- potrzebne dla Tendsto, atTop i 𝓝 (wpisz: \nhds)

def ZbiegaDo (a : ℕ → ℝ) (L : ℝ) : Prop :=
  ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |a n - L| < ε

/- Zadanie D1: granica jest jednoznaczna.

Pomysł: gdyby L1 ≠ L2, weźmy ε = |L1 - L2| / 2. Dla n = max N1 N2
  |L1 - L2| ≤ |aₙ - L1| + |aₙ - L2| < ε + ε = |L1 - L2|,
sprzeczność.
Przydatne: `by_contra hne`, `abs_pos`, `sub_ne_zero`,
`le_max_left`, `le_max_right`,
`abs_sub_le` : |a - c| ≤ |a - b| + |b - c|,
`abs_sub_comm` : |a - b| = |b - a|, oraz `linarith` na końcu. -/

theorem ZbiegaDo.jednoznacznosc {a : ℕ → ℝ} {L1 L2 : ℝ}
    (h1 : ZbiegaDo a L1) (h2 : ZbiegaDo a L2) : L1 = L2 := by
  sorry

/- Zadanie D2: związek z definicją z mathlib.
Przydatne: `Metric.tendsto_atTop`, `Real.dist_eq`.
Wskazówka: `rw [Metric.tendsto_atTop]`, potem
`simp only [ZbiegaDo, Real.dist_eq]`. -/

theorem zbiegaDo_iff_tendsto (a : ℕ → ℝ) (L : ℝ) :
    ZbiegaDo a L ↔ Tendsto a atTop (𝓝 L) := by
  sorry

/- Zadanie D3: przeczytaj pełny dowód z dodatku do wykładu 3
(1/(n+1) → 0) i spróbuj go odtworzyć krok po kroku, patrząc
na InfoView. -/

theorem jeden_przez_n (a : ℕ → ℝ) (ha : ∀ n, a n = 1 / ((n : ℝ) + 1)) :
    ZbiegaDo a 0 := by
  sorry
