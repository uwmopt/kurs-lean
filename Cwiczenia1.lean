/-
  ĆWICZENIA 1 – pierwsze dowody
  Kurs: „Wstęp do dowodzenia w Lean 4”, spotkanie 1

  Każda część ma trzy kroki:
    (a) przykład rozwiązany – przeczytaj go i obejrzyj stan w InfoView,
    (b) przykład z jedną luką – zastąp `sorry` jedną linią,
    (c) zadanie samodzielne.

  Kontrola: przy gotowym twierdzeniu na marginesie pojawia się znak ✓✓.
  Żółte ostrzeżenie „declaration uses 'sorry'” oznacza, że dowód
  nie jest jeszcze gotowy.
  Otwieraj w VS Code cały folder projektu (File → Open Folder).
  Zadania dla chętnych: plik Cwiczenia1_dodatkowe.lean.
-/

import Mathlib

/-! ## Część 1: `rfl` – obie strony po obliczeniu są równe -/

-- (a) przykład rozwiązany
example : 3 + 4 = 7 := by
  rfl

-- (b) jedna luka
example : 2 * 5 = 10 := by
  sorry

-- (c) samodzielnie
example (n : ℕ) : n + 0 = n := by
  sorry

/-! ## Część 2: `exact` – użycie założenia -/

-- (a) przykład rozwiązany
example (a b : ℕ) (h1 : a = b) (h2 : b = 5) : a = 5 := by
  exact Eq.trans h1 h2

-- (b) jedna luka (wskazówka: Eq.symm)
example (a b : ℕ) (h1 : a = b) : b = a := by
  sorry

-- (c) samodzielnie (wskazówka: Eq.trans i Eq.symm razem)
example (a b c : ℕ) (h1 : a = b) (h2 : c = b) : a = c := by
  sorry

/-! ## Część 3: `rw` – przepisanie równości -/

-- (a) przykład rozwiązany
example (f : ℕ → ℕ) (a b : ℕ) (h1 : a = b) : f a = f b := by
  rw [h1]

-- (b) jedna luka
example (a b : ℕ) (h1 : a = b) : a + 1 = b + 1 := by
  sorry

-- (c) samodzielnie (obserwuj cel po każdym kroku przepisania)
example (f : ℕ → ℕ) (a b c : ℕ) (h1 : a = b) (h2 : b = c) : f a = f c := by
  sorry

/-! ## Część 4: `calc` – łańcuch równości -/

-- (a) przykład rozwiązany
example (a b c : ℕ) (h1 : a = b) (h2 : b = c) : a = c := by
  calc a = b := h1
    _ = c := h2

-- (b) jedna luka: uzupełnij środkowy krok
example (f : ℕ → ℕ) (a b c d : ℕ)
    (h1 : a = b) (h2 : b = c) (h3 : f c = d) : f a = d := by
  calc f a = f b := by rw [h1]
    _ = f c := by sorry
    _ = d := h3

-- (c) samodzielnie: łańcuch z trzech kroków
example (a b c d : ℕ) (h1 : a = b) (h2 : b = c) (h3 : c = d) : a = d := by
  sorry

/-! ## Część 5: `omega` – arytmetyka liniowa na liczbach naturalnych -/

-- (a) przykład rozwiązany
example (n : ℕ) (h : n + 3 = 7) : n = 4 := by
  omega

-- (c) samodzielnie
example (a : ℕ) (h : 2 * a = 6) : a = 3 := by
  sorry

/- KONIEC części podstawowej. Gdy wszystkie twierdzenia mają ✓✓,
   można przejść do pliku Cwiczenia1_dodatkowe.lean. -/
