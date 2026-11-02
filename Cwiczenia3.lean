/-
  ĆWICZENIA 3 – wspólny projekt
  Kurs: „Wstęp do dowodzenia w Lean 4”, spotkanie 3

  Wybierz JEDEN temat. Układ jak wcześniej: (a) przykład rozwiązany,
  (b) przykład z jedną luką, (c) zadanie samodzielne.
  Kontrola: ✓✓ na marginesie przy gotowym twierdzeniu.
  Zadania dla chętnych: plik Cwiczenia3_dodatkowe.lean.
-/

import Mathlib

/-! ## Temat 1: tożsamości algebraiczne – `ring` -/

-- (a) przykład rozwiązany
example (a b : ℝ) : (a + b) ^ 2 = a ^ 2 + 2 * a * b + b ^ 2 := by
  ring

-- (b) jedna luka
example (a b : ℝ) : (a - b) * (a + b) = a ^ 2 - b ^ 2 := by
  sorry

-- (c) samodzielnie. Potem zmień jeden współczynnik we wzorze:
-- co powie Lean?
example (a b : ℝ) : (a + b) ^ 3 = a ^ 3 + 3 * a ^ 2 * b + 3 * a * b ^ 2 + b ^ 3 := by
  sorry

/-! ## Temat 2: nierówności – `nlinarith` z pomysłem człowieka

`nlinarith [sq_nonneg (wyrażenie)]`: podajemy fakt, że kwadrat
wyrażenia jest nieujemny; resztę rachunku robi Lean. -/

-- (a) przykład rozwiązany
example (a b : ℝ) : 2 * a * b ≤ a ^ 2 + b ^ 2 := by
  nlinarith [sq_nonneg (a - b)]

-- (b) jedna luka: ten sam pomysł co w (a)
example (a b : ℝ) : a * b ≤ (a ^ 2 + b ^ 2) / 2 := by
  sorry

-- (c) samodzielnie: jaki kwadrat jest tu pomysłem?
example (x : ℝ) : 2 * x ≤ x ^ 2 + 1 := by
  sorry

/-! ## Temat 3: granica ciągu

Definicja z wykładu (mathlib ma to pojęcie jako Filter.Tendsto). -/

def ZbiegaDo (a : ℕ → ℝ) (L : ℝ) : Prop :=
  ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |a n - L| < ε

-- (a) przykład rozwiązany: ciąg stały zbiega do swojej wartości
theorem ZbiegaDo.ciag_staly (c : ℝ) : ZbiegaDo (fun _ => c) c := by
  intro ε hε                    -- niech ε > 0
  refine ⟨0, fun n _ => ?_⟩     -- bierzemy N = 0
  simpa using hε                -- |c - c| = 0 < ε

-- (b) jedna luka: jeśli aₙ → L, to (aₙ + c) → (L + c)
theorem ZbiegaDo.shift {a : ℕ → ℝ} {L c : ℝ} (h : ZbiegaDo a L) :
    ZbiegaDo (fun n => a n + c) (L + c) := by
  intro ε hε
  obtain ⟨N, hN⟩ := h ε hε      -- N z definicji granicy ciągu a
  refine ⟨N, fun n hn => ?_⟩
  show |a n + c - (L + c)| < ε
  rw [show a n + c - (L + c) = a n - L by ring]
  sorry                         -- obejrzyj cel i założenia w InfoView

-- (c) samodzielnie: jeśli aₙ → L, to (c + aₙ) → (c + L).
-- Wzoruj się na (b).
theorem ZbiegaDo.shift' {a : ℕ → ℝ} {L c : ℝ} (h : ZbiegaDo a L) :
    ZbiegaDo (fun n => c + a n) (c + L) := by
  sorry
