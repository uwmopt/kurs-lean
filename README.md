# Kurs „Wstęp do dowodzenia w Lean 4”

Wydział Matematyki i Informatyki UWM w Olsztynie. Prowadzący: Ivan Matychyn.

## Zawartość

| Plik | Opis |
|---|---|
| `Test.lean` | test środowiska (powinno pojawić się „No goals”) |
| `Cwiczenia1.lean` | ćwiczenia do spotkania 1: pierwsze dowody |
| `Cwiczenia2.lean` | ćwiczenia do spotkania 2: logika, taktyki, indukcja |
| `Cwiczenia3.lean` | ćwiczenia do spotkania 3 (dla chętnych): granice ciągów |

## Jak pobrać projekt

Potrzebne są: program **git**, edytor **VS Code** z rozszerzeniem **Lean 4** (autor: leanprover) oraz ok. 10 GB wolnego miejsca. Szczegóły są w instrukcji instalacji rozesłanej uczestnikom.

**Wariant A (VS Code, zalecany).** W przewodniku rozszerzenia Lean 4, w kroku *Set up Lean 4 project*, wybierz *Download an existing project*, potem *Git repository URL*, i wpisz adres:

```
https://github.com/uwmopt/kurs-lean.git
```

**Wariant B (terminal).**

```
git clone https://github.com/uwmopt/kurs-lean.git
cd kurs-lean
lake exe cache get
```

Potem otwórz w VS Code cały folder projektu (*File → Open Folder*).

## Test

Otwórz `Test.lean` i postaw kursor na końcu ostatniej linii. W panelu InfoView powinno pojawić się **No goals** i komunikat **Goals accomplished!**. Pierwsze otwarcie pliku z `import Mathlib` trwa kilka minut, następne są szybkie.

## Ważne

- Otwieraj w VS Code **cały folder** projektu, nie pojedynczy plik.
- **Nie uruchamiaj `lake update`.** To zmienia wersję biblioteki mathlib, a wszyscy uczestnicy mają mieć tę samą.
- Rozwiązanie ćwiczenia jest gotowe, gdy w panelu *Problems* (`Ctrl+Shift+M`) nie ma błędów ani ostrzeżeń o `sorry`.
