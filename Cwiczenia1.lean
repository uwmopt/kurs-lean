/-
  ĆWICZENIA 1 – pierwsze kroki w Lean 4
  Kurs: „Wstęp do dowodzenia w Lean 4", Wykład 1

  Zasady:
  * Zastąp każde `sorry` rzeczywistym dowodem.
  * Plik jest w katalogu projektu kursu; otwieraj w VS Code cały
    katalog projektu (File → Open Folder), nie pojedynczy plik.
  * Kontrola: brak czerwonych podkreśleń, a w panelu Problems
    (Ctrl+Shift+M) brak ostrzeżeń "declaration uses 'sorry'".
    (W terminalu, w katalogu projektu: lake env lean Cwiczenia1.lean)
  * Potrzebne narzędzia: rfl, exact, Eq.symm, Eq.trans, rw, calc,
    omega (wykład 1).
-/

import Mathlib

/- Wskazówka: każde `sorry` można podejrzeć w InfoView, stawiając
   kursor na końcu linii. Cel i dostępne hipotezy zobaczysz na dole
   ekranu. -/


section
/-! ## Zadanie 1: refleksyjność

Wskazówka: `rfl` dowodzi celów, których obie strony są
definicyjnie równe.
-/

example : 2 + 2 = 4 := by
  sorry

example (n : ℕ) : n + 0 = n := by
  sorry

end

section
/-! ## Zadanie 2: symetria równości

Wskazówka: `Eq.symm` zamienia `a = b` na `b = a`.
-/

example (a b : ℕ) (h : a = b) : b = a := by
  sorry

end

section
/-! ## Zadanie 3: przechodniość równości

Wskazówka: `Eq.trans h₁ h₂` składa `a = b` z `b = c`.
-/

example (a b c : ℕ) (h₁ : a = b) (h₂ : b = c) : a = c := by
  sorry

end

section
/-! ## Zadanie 4: przekazywanie równości

Cel „f a = f b" przy założeniu „a = b".
Wskazówka: po `rw [h]` cel stanie się `f b = f b`.
-/

example (f : ℕ → ℕ) (a b : ℕ) (h : a = b) : f a = f b := by
  sorry

end

section
/-! ## Zadanie 5: łańcuch równości z `calc`

Udowodnij: jeśli a = b, b = c oraz f c = d, to f a = d.
Wskazówka: użyj `calc` albo trzech kroków `rw`.
-/

example (f : ℕ → ℕ) (a b c d : ℕ)
    (h1 : a = b) (h2 : b = c) (h3 : f c = d) : f a = d := by
  sorry

end

section
/-! ## Zadanie 6 (gwiazdka): arytmetyka

Niech `omega` będzie Twoim przyjacielem w liniowej arytmetyce.
-/

example (a b : ℕ) (h : a + b = 10) : b + a = 10 := by
  sorry

example (a b : ℕ) (h : 2 * a = 6) : a = 3 := by
  sorry

end

/- KONIEC. Kontrola: panel Problems bez ostrzeżeń o `sorry`. -/
