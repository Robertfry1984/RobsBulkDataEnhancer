# Requirements List

## Core data grid
- Provide an Excel-like central data grid that supports copy/paste of 1–500k+ rows.
- Enable copy of selected cells to clipboard (tab-delimited).
- Enable paste of tab-delimited data from clipboard into the grid.
- Ensure text stored in cells is clean and Excel-friendly (UTF-8 with BOM on CSV export).

## Panels and layout
- Provide a left panel for the main question/prompt input.
- Provide a right panel with settings to:
  - select input column
  - select row range (start/end)
  - select output column
  - provide response format/constraints text
  - set per-call delay in milliseconds
  - start/stop synchronous processing
  - optional list/seed generation for column A

## API configuration
- Allow configuration of an arbitrary API endpoint.
- Allow custom auth header name and private key storage.
- Persist endpoint and request configuration; store private key securely.
- Ensure composed requests are JSON-safe.
- Support text responses added directly to cells (not raw JSON).

## Processing requirements
- Process rows synchronously in order with a configurable delay.
- Provide a Stop control that halts processing safely.
- Keep the UI responsive during processing.

## Data I/O
- Provide Save As dialog supporting CSV and XLSX.
- (Optional) Load CSV/XLSX into the grid for convenience.

## UX
- Modern, beautiful UI with a light/dark mode toggle.
- Stable and predictable behavior for large datasets.

## Platform
- Windows desktop app built with PyQt6.
