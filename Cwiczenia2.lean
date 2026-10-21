/-
  ĆWICZENIA 2 — logika, taktyki, indukcja
  Kurs: „Wstęp do dowodzenia w Lean 4", Wykład 2

  Zasady jak w poprzednim pliku: zastąp wszystkie `sorry`.
  Potrzebne narzędzia: intro, apply, exact, constructor, rcases,
  left/right, use, by_contra, induction, omega, ring, exact? (wykład 2).
  Po każdym kroku patrz na InfoView. Nie bój się eksperymentować!
-/

import Mathlib

section
/-! ## Zadanie 1: koniunkcja

Wskazówka: `constructor` rozbija cel `P ∧ Q`; kropka `·`
rozpoczyna dowód kolejnego celu.
-/

example (P Q : Prop) (hP : P) (hQ : Q) : P ∧ Q := by
  sorry

example (P Q : Prop) (h : P ∧ Q) : Q ∧ P := by
  sorry

end

section
/-! ## Zadanie 2: alternatywa i analiza przypadków

Wskazówka: `rcases h with h | h` rozpakowuje dowód `∨`.
-/

example (P Q : Prop) (h : P ∨ Q) : Q ∨ P := by
  sorry

example (P Q R : Prop) (h : P ∨ Q) (hP : P → R) (hQ : Q → R) : R := by
  sorry

end

section
/-! ## Zadanie 3: implikacja i `intro`

Wskazówka: `intro` wprowadza przesłankę do kontekstu.
-/

example (P Q R : Prop) (h : P → Q) (h2 : Q → R) : P → R := by
  sorry

end

section
/-! ## Zadanie 4: kwantyfikatory

Wskazówka: dowód `∀` zaczyna się od `intro n`;
   dla celu `∃` użyj `use` albo podaj parę `⟨..., ...⟩`.
-/

example (P : ℕ → Prop) (h : ∀ n, P n) : ∃ m, P m := by
  sorry

example (P Q : ℕ → Prop) (h : ∀ n, P n → Q n)
    (hP : ∃ n, P n) : ∃ n, Q n := by
  sorry

end

section
/-! ## Zadanie 5: de Morgan

Udowodnij: ¬(P ∨ Q) ↔ ¬P ∧ ¬Q.
Wskazówka: `constructor` dla `↔`; w prawo przyda się
`intro h` i `fun hp => h (Or.inl hp)`.
-/

example (P Q : Prop) : ¬(P ∨ Q) ↔ ¬P ∧ ¬Q := by
  sorry

end

section
/-! ## Zadanie 6: sprzeczność

Z `False` wynika cokolwiek; `¬P` to `P → False`.
-/

example (P : Prop) (h : False) : P := by
  sorry

example (P : Prop) (h1 : P) (h2 : ¬ P) : 0 = 1 := by
  sorry

end

section
/-! ## Zadanie 7: indukcja — rozgrzewka

Udowodnij: 0 + n = n dla wszystkich n.
Wskazówka: `induction n with | zero => ... | succ k ih => ...`.
-/

theorem zero_add' (n : ℕ) : 0 + n = n := by
  sorry

end

section
/-! ## Zadanie 8: indukcja z arytmetyką

Udowodnij, że suma 0 + 1 + ... + n wynosi n * (n + 1) / 2.
Aby uniknąć dzielenia, dowodzimy wzoru pomnożonego przez 2.
Sumę definiujemy rekurencyjnie.

Wskazówka: `induction n with | zero => ... | succ k ih => ...`.
Przypadek zero: `rfl` (albo `simp [suma]`).
Krok: `simp only [suma]` rozwija suma (k + 1) do suma k + (k + 1);
potem `rw [mul_add, ih]`, a na końcu `ring`.
-/

def suma : ℕ → ℕ
  | 0 => 0
  | (n + 1) => suma n + (n + 1)

theorem suma_wzor (n : ℕ) : 2 * suma n = n * (n + 1) := by
  sorry

end

section
/-! ## Zadanie 9: niestandardowa kolejność

Udowodnij: jeśli dla wszystkich n zachodzi P n, to P (k + 3).
Wskazówka: zadanie na dokładne czytanie celu.
-/

example (P : ℕ → Prop) (h : ∀ n, P n) (k : ℕ) : P (k + 3) := by
  sorry

end

section
/-! ## Zadanie 10 (gwiazdka): poszukaj w mathlib

Nie dowodź ręcznie tego, co ma mathlib.
Umieść kursor na końcu linii (przed `sorry`) i użyj `exact?`.
Potem zastąp `sorry` znalezionym lematem.

Cel: a ≤ b, b ≤ a ⊢ a = b.
-/

example (a b : ℕ) (h1 : a ≤ b) (h2 : b ≤ a) : a = b := by
  sorry

end

/- KONIEC. Powodzenia! Kontrola: panel Problems bez ostrzeżeń o `sorry`. -/
