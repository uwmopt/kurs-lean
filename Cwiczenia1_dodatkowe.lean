/-
  ĆWICZENIA 1 – zadania dla chętnych
  Kurs: „Wstęp do dowodzenia w Lean 4”, spotkanie 1
  Narzędzia: rfl, exact, Eq.symm, Eq.trans, rw, calc, omega.
-/

import Mathlib

-- Zadanie D1: przemienność dodawania w konkretnym założeniu
example (a b : ℕ) (h : a + b = 10) : b + a = 10 := by
  sorry

-- Zadanie D2: dwa przepisania, potem rachunek
example (x y : ℕ) (h1 : x = y + 2) (h2 : y = 3) : x = 5 := by
  sorry

-- Zadanie D3: przepisanie, a potem użycie założenia
example (f : ℕ → ℕ) (a b : ℕ) (h1 : a = b) (h2 : f b = 7) : f a = 7 := by
  sorry

-- Zadanie D4: łańcuch nierówności (calc działa też dla ≤ i <)
example (a b c : ℕ) (h1 : a ≤ b) (h2 : b < c) : a < c := by
  sorry

-- Zadanie D5: odejmowanie w ℕ jest obcięte. Najpierw zgadnij,
-- czy twierdzenie jest prawdziwe, potem sprawdź przez omega.
example (n : ℕ) (h : n ≥ 5) : n - 5 + 5 = n := by
  sorry
