# Calendar Project - Design Documentation

## Overview

A console-based calendar application written in C that allows users to view calendars, find days of the week for specific dates, and manage personal notes/reminders for specific dates.

## System Architecture

### Core Components

1. **Date Management System**
   - Handles date validation and calculations
   - Supports dates from year 1600 onwards
   - Leap year calculation and validation

2. **Calendar Display Engine**
   - Renders monthly calendar views
   - Console-based UI with cursor positioning
   - Navigation between months (previous/next)

3. **Note Management System**
   - File-based persistent storage
   - Add and view notes for specific dates
   - Binary file operations for data persistence

4. **Day Calculation Algorithm**
   - Custom implementation to determine day of week
   - Based on reference year 1600
   - Handles century transitions and leap years

## Data Structures

### Date Structure
```c
struct Date {
    int dd;  // Day (1-31)
    int mm;  // Month (1-12)
    int yy;  // Year (>=1600)
}
```

### Remainder (Note) Structure
```c
struct Remainder {
    int dd;           // Day
    int mm;           // Month
    char note[50];    // Note content (max 50 characters)
}
```

## Key Algorithms

### 1. Leap Year Detection
- **Algorithm**: A year is a leap year if:
  - Divisible by 400, OR
  - Divisible by 4 AND NOT divisible by 100
- **Complexity**: O(1)

### 2. Day of Week Calculation
- **Method**: Custom calculation from reference year 1600
- **Steps**:
  1. Calculate years elapsed from 1600
  2. Account for leap years and century offsets
  3. Add days from beginning of year to target date
  4. Apply modulo 7 for day of week
  5. Special adjustment for post-2000 dates
- **Complexity**: O(n) where n is the month number

### 3. Calendar Rendering
- **Layout**: 7-column grid (Sunday to Saturday)
- **Positioning**: Dynamic cursor control using Windows Console API
- **Spacing**: 4-character spacing between dates

## File I/O

### Note Storage
- **File**: `note.dat`
- **Format**: Binary file
- **Operations**:
  - Append mode for adding notes
  - Read mode for displaying notes
  - Sequential search for note lookup
- **Structure**: Array of `Remainder` structs

## User Interface

### Main Menu Options
1. **Find Out the Day**: Input a specific date to get the day of week
2. **Print All Days of Month**: Display full monthly calendar with navigation
3. **Add Note**: Create a reminder for a specific date
4. **Exit**: Terminate the application

### Calendar View Controls
- `n` - Navigate to next month
- `p` - Navigate to previous month
- `s` - Show notes for current month
- `q` - Quit calendar view

### Display Layout
```
---------------------------
    [Month Name], [Year]
---------------------------
S   M   T   W   T   F   S
01  02  03  04  05  06  07
08  09  10  11  12  13  14
...
```

## Platform Dependencies

### Windows-Specific Features
- **Console API**: Uses `windows.h` for cursor positioning
- **Function**: `SetConsoleCursorPosition()` for gotoxy implementation
- **Title**: `SetConsoleTitle()` for window title

### Legacy Dependencies
- **conio.h**: Used for `getch()` function (non-standard, Windows-specific)

## Validation & Error Handling

### Input Validation
- Month: Must be between 1-12
- Day: Must be valid for the given month and year
- Year: Must be >= 1600

### Error Messages
- Invalid month/date values
- File operation failures
- No notes found for selected month

## Limitations

1. **Date Range**: Only supports dates from year 1600 onwards
2. **Note Storage**: 50-character limit per note
3. **Platform**: Windows-only (due to console API usage)
4. **File System**: No error recovery for corrupted data files
5. **Concurrency**: No multi-user or concurrent access support
6. **Search**: Linear search through notes (no indexing)

## Future Enhancements

### Potential Improvements
1. Cross-platform support (replace Windows-specific functions)
2. Enhanced note features (edit, delete, search)
3. Date range validation improvements
4. Database integration instead of binary files
5. Color-coded calendar display
6. Holiday marking functionality
7. Multiple notes per date
8. Export calendar to various formats
9. Recurring reminders
10. Better error handling and recovery

## Performance Considerations

- **Day Calculation**: O(1) after preprocessing
- **Calendar Rendering**: O(1) for single month
- **Note Lookup**: O(n) where n is total number of notes
- **File I/O**: Sequential read/write operations

## Code Organization

### Modules (Functional Groups)
1. **Utility Functions**: `gotoxy()`, `check_leapYear()`
2. **Date Operations**: `increase_month()`, `decrease_month()`, `getNumberOfDays()`
3. **Day Calculation**: `getDayNumber()`, `getDay()`, `getName()`
4. **Display Functions**: `print_date()`, `printMonth()`
5. **Note Management**: `AddNote()`, `showNote()`, `checkNote()`
6. **Main Controller**: `main()` - menu system and user interaction

## Build Instructions

### Prerequisites
- C compiler with Windows support (MinGW, MSVC)
- Windows operating system

### Compilation
```bash
gcc calendar.c -o calendar.exe
```

### Execution
```bash
./calendar.exe
```

## Data Flow

1. User selects menu option
2. Input collected and validated
3. Appropriate function called
4. Data processed (calculation/file operation)
5. Result displayed on console
6. Wait for user input to continue
7. Clear screen and return to menu

---

**Version**: 1.0  
**Last Updated**: 2024  
**License**: Not specified