/-
  ĆWICZENIA 3 – formalizacja „na poważnie" (dla chętnych)
  Kurs: „Wstęp do dowodzenia w Lean 4", Wykład 3

  Temat: granice ciągów. Definiujemy pojęcie zbieżności
  „ręcznie" (dla ćwiczenia; mathlib ma je jako Filter.Tendsto),
  a potem dowodzimy kilku twierdzeń.
  Kontrola: panel Problems bez ostrzeżeń o `sorry`.
-/

import Mathlib

open Filter Topology   -- potrzebne dla Tendsto, atTop i 𝓝

/-! ## Część A: definicja

Przypomnienie z analizy:
  aₙ → L  ⇔  ∀ ε > 0  ∃ N  ∀ n ≥ N,  |aₙ - L| < ε.
-/

def ZbiegaDo (a : ℕ → ℝ) (L : ℝ) : Prop :=
  ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |a n - L| < ε

/-! ## Część B: własności podstawowe -/

section

/- Zadanie B1: ciąg stały zbiega do swojej wartości.

Wskazówka: `intro ε hε`, potem `refine ⟨0, fun n _ => ?_⟩`.
Cel ma postać |c - c| < ε. Spróbuj `simpa using hε`
(simp zamieni |c - c| na 0).
-/

theorem ZbiegaDo.ciag_staly (c : ℝ) : ZbiegaDo (fun _ => c) c := by
  sorry

end

section

/- Zadanie B2: przesunięcie ciągu o stałą.

Jeśli aₙ → L, to (aₙ + c) → (L + c).
Wskazówka: `intro ε hε`, `obtain ⟨N, hN⟩ := h ε hε`,
`refine ⟨N, fun n hn => ?_⟩`. Cel zapisz czytelnie przez
`show |a n + c - (L + c)| < ε`, potem
`rw [show a n + c - (L + c) = a n - L by ring]`
i dokończ przez `hN n hn`.
-/

theorem ZbiegaDo.shift {a : ℕ → ℝ} {L c : ℝ} (h : ZbiegaDo a L) :
    ZbiegaDo (fun n => a n + c) (L + c) := by
  sorry

end

section

/- Zadanie B3 (gwiazdka): granica jest jednoznaczna.

Pomysł: gdyby L₁ ≠ L₂, weźmy ε = |L₁ - L₂| / 2. Dla n = max N₁ N₂
  |L₁ - L₂| ≤ |aₙ - L₁| + |aₙ - L₂| < ε + ε = |L₁ - L₂|,
sprzeczność.
Przydatne: `by_contra hne`, `abs_pos`, `sub_ne_zero`,
`le_max_left`, `le_max_right`,
`abs_sub_le` : |a - c| ≤ |a - b| + |b - c|,
`abs_sub_comm` : |a - b| = |b - a|,
oraz `linarith` na końcu. To najtrudniejsze zadanie pliku.
-/

theorem ZbiegaDo.jednoznacznosc {a : ℕ → ℝ} {L₁ L₂ : ℝ}
    (h1 : ZbiegaDo a L₁) (h2 : ZbiegaDo a L₂) : L₁ = L₂ := by
  sorry

end

/-! ## Część C: związek z mathlib

Mathlib definiuje zbieżność przez filtry:
  `Tendsto a atTop (𝓝 L)`
(symbol 𝓝 wpisujemy w VS Code jako `\nhds`).
-/

section

/- Zadanie C1 (gwiazdka): udowodnij, że `ZbiegaDo a L` i wersja
biblioteczna są równoważne. Przydatne lematy (dokładną postać
sprawdź przez `#check`):
  * `Metric.tendsto_atTop` : Tendsto u atTop (𝓝 a) ↔
      ∀ ε > 0, ∃ N, ∀ n ≥ N, dist (u n) a < ε
  * `Real.dist_eq` : dist x y = |x - y|
Wskazówka: `rw [Metric.tendsto_atTop]`, potem
`simp only [ZbiegaDo, Real.dist_eq]`.
-/

theorem zbiegaDo_iff_tendsto (a : ℕ → ℝ) (L : ℝ) :
    ZbiegaDo a L ↔ Tendsto a atTop (𝓝 L) := by
  sorry

end

/- KONIEC. Jeśli wszystkie `sorry` zniknęły – brawo!
  Następny krok: spróbuj sformułować (samo sformułować!)
  twierdzenie z własnej dziedziny. -/
