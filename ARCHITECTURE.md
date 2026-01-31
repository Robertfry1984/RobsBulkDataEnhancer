# Architecture Design

## Overview
A single-window PyQt6 application with a menu bar and three main regions:
- Left panel: main question/prompt input
- Center: Excel-like grid (QTableView + custom model)
- Right panel: query settings, controls, and utilities

Processing is handled by a worker thread to keep the UI responsive while requests execute synchronously with a configurable delay.

## Components

### UI Layer
- MainWindow (QMainWindow)
  - Menu bar (File, Settings, View, Help)
  - Splitter with left, center, right panels
  - Status bar for progress and state
- LeftPanel
  - QPlainTextEdit for main question
- CenterPanel
  - QTableView bound to DataTableModel
- RightPanel
  - Input column, output column, row range, delay, response constraints
  - Buttons: Go, Stop, Generate Rows, Fill Column A

### Data Model
- DataTableModel (QAbstractTableModel)
  - Backed by a list-of-lists of strings
  - Supports dynamic growth for large paste operations
  - Handles header labels (A, B, C...) and 1-based row numbers
  - Efficient bulk updates on paste

### Processing
- ProcessingWorker (QThread)
  - Iterates row-by-row synchronously
  - Builds prompt from: question + row value + response constraints
  - Sends POST requests to configured endpoint
  - Applies delay between calls
  - Emits signals to update cells and progress
  - Supports stop flag

### Settings
- QSettings for non-sensitive config (endpoint, request template, response JSON path)
- keyring for sensitive API key storage
- Settings dialog for editing these values

### I/O
- Save As dialog for CSV/XLSX
- CSV export in UTF-8 with BOM for Excel compatibility
- XLSX export via openpyxl

## Data Flow
1. User pastes data into grid or generates seed rows.
2. User sets input/output columns, range, and response constraints.
3. Worker builds prompt, sends API call, inserts response into output column.
4. UI updates via signals; user can stop anytime.

## Error Handling
- Network errors displayed in status bar and non-blocking dialogs
- Invalid settings (columns, ranges) are validated before running
- Response extraction falls back to raw text if JSON parsing fails

## Extensibility
- Request template and JSON response path allow flexible endpoints
- Additional export formats can be added in the Save handler
