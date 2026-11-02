/-
  ĆWICZENIA 2 – zadania dla chętnych
  Kurs: „Wstęp do dowodzenia w Lean 4”, spotkanie 2
  Narzędzia ze slajdów w dodatku do wykładu 2: left, right,
  rcases h with h1 | h2, by_contra, False.elim, absurd.
-/

import Mathlib

-- Zadanie D1: alternatywa jest przemienna
example (P Q : Prop) (h : P ∨ Q) : Q ∨ P := by
  sorry

-- Zadanie D2: rozumowanie przez przypadki
example (P Q R : Prop) (h : P ∨ Q) (hP : P → R) (hQ : Q → R) : R := by
  sorry

-- Zadanie D3: prawo de Morgana
-- Wskazówka: `constructor` dla ↔; po intro h: `fun hp => h (Or.inl hp)`.
example (P Q : Prop) : ¬(P ∨ Q) ↔ ¬P ∧ ¬Q := by
  sorry

-- Zadanie D4: z fałszu wynika wszystko
example (P : Prop) (h : False) : P := by
  sorry

-- Zadanie D5: sprzeczne założenia
example (P : Prop) (h1 : P) (h2 : ¬ P) : 0 = 1 := by
  sorry

-- Zadanie D6: dokładne czytanie celu
example (P : ℕ → Prop) (h : ∀ n, P n) (k : ℕ) : P (k + 3) := by
  sorry

-- Zadanie D7: indukcja samodzielnie (wskazówka: slajd „Indukcja”)
theorem zero_add' (n : ℕ) : 0 + n = n := by
  sorry
