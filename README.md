# Console Calendar Application in C

This project is a console-based Calendar Application written in C for Windows.
It displays monthly calendars, finds the day of a specific date, allows month navigation through keyboard input, and supports adding and viewing notes stored in a binary file.

---

## Features

* Display the full calendar for any month and year
* Navigate months:

  * `n` → next month
  * `p` → previous month
  * `s` → show notes for the selected month
  * `q` → exit calendar view
* Add notes stored in a binary file (`note.dat`)
* Find the weekday for any given date
* Text-based interface using cursor positioning (`gotoxy`)
* Uses Windows API (`windows.h`) for console cursor control

---

## Project Structure

```
Console-Calendar-App-C/
│
├── src/
│   └── calendar.c
│
├── data/
│   └── note.dat          (empty placeholder file for storing notes)
│
├── docs/
│   ├── design.md         (internal documentation)
│
├── Makefile
└── README.md
```

---

## Building and Running

### Using Makefile (recommended)

```
make
make run
```

### Manual Compilation (Windows, GCC)

```
gcc src/calendar.c -o calendar
calendar.exe
```

---

## Notes File (`note.dat`)

The application stores user-created notes in a binary file named `note.dat`.
This repository includes an empty placeholder file to ensure the program runs correctly.
New notes will automatically be appended when the user adds them through the interface.

---

## Implementation Overview

1. **Date and Calendar Logic**

   * Leap year detection
   * Days-per-month calculation
   * Day-of-week calculation using a custom algorithm

2. **Calendar Rendering**

   * Uses `gotoxy()` for cursor movement
   * Prints dates aligned under correct weekdays
   * Wraps to the next line after Saturday

3. **Note Management**

   * Notes stored as a struct in a binary file
   * Functions to add and display notes
   * Data persists between runs

4. **User Interaction**

   * Menu-based navigation
   * Keyboard-driven month switching
   * Input validation for dates

---

## Documentation

Additional documentation is available in `docs/design.md`, explaining
the internal logic, functions, and program flow in detail.

---

## License

This project is released under the MIT License.

---


