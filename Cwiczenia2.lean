/-
  ĆWICZENIA 2 – logika, kwantyfikatory, mathlib, indukcja
  Kurs: „Wstęp do dowodzenia w Lean 4”, spotkanie 2

  Układ jak w Cwiczenia1.lean: (a) przykład rozwiązany,
  (b) przykład z jedną luką, (c) zadanie samodzielne.
  Kontrola: ✓✓ na marginesie przy gotowym twierdzeniu.
  Nowe narzędzia: intro, constructor, obtain, use, exact?, induction.
  Zadania dla chętnych: plik Cwiczenia2_dodatkowe.lean.
-/

import Mathlib

/-! ## Część 1: implikacja – `intro` -/

-- (a) przykład rozwiązany
example (P Q R : Prop) (h1 : P → Q) (h2 : Q → R) : P → R := by
  intro hp
  exact h2 (h1 hp)

-- (b) jedna luka
example (P Q : Prop) (hq : Q) : P → Q := by
  intro hp
  sorry

-- (c) samodzielnie
example (P Q R : Prop) (h : P → Q → R) (hp : P) (hq : Q) : R := by
  sorry

/-! ## Część 2: koniunkcja – `constructor`, `obtain` -/

-- (a) przykład rozwiązany
example (P Q : Prop) (hp : P) (hq : Q) : P ∧ Q := by
  constructor
  · exact hp
  · exact hq

-- (b) jedna luka
example (P Q : Prop) (h : P ∧ Q) : Q ∧ P := by
  obtain ⟨hp, hq⟩ := h
  sorry

-- (c) samodzielnie
example (P Q R : Prop) (h : P ∧ Q) (h2 : Q → R) : P ∧ R := by
  sorry

/-! ## Część 3: kwantyfikatory – `use`, `obtain` -/

-- (a) przykład rozwiązany
example : ∃ n : ℕ, n + 2 = 5 := by
  use 3

-- (b) jedna luka
example (P Q : ℕ → Prop) (h : ∀ n, P n → Q n)
    (hp : ∃ n, P n) : ∃ n, Q n := by
  obtain ⟨n, hn⟩ := hp
  sorry

-- (c) samodzielnie
example : ∃ n : ℕ, 2 * n = 10 := by
  sorry

/-! ## Część 4: gotowe twierdzenia – `exact?`

Wpisz `exact?` zamiast `sorry`. W InfoView pojawi się propozycja
„Try this: …”; kliknij ją, aby wstawić do pliku. -/

example (a b : ℕ) (h1 : a ≤ b) (h2 : b ≤ a) : a = b := by
  sorry

/-! ## Część 5: indukcja na gotowym schemacie

Suma 0 + 1 + ... + n wynosi n(n + 1)/2. Aby uniknąć dzielenia,
dowodzimy wzoru pomnożonego przez 2. Sumę definiujemy rekurencyjnie. -/

def suma : ℕ → ℕ
  | 0 => 0
  | (n + 1) => suma n + (n + 1)

-- Brakuje jednej linii: jednej taktyki ze slajdu „Arytmetyka automatyczna”.
-- Obejrzyj cel w InfoView przed tą linią.
theorem suma_wzor (n : ℕ) : 2 * suma n = n * (n + 1) := by
  induction n with
  | zero => rfl
  | succ k ih =>
    simp only [suma]     -- rozwija suma (k + 1) do suma k + (k + 1)
    rw [mul_add, ih]     -- używa założenia indukcyjnego ih
    sorry

/- KONIEC części podstawowej. -/
