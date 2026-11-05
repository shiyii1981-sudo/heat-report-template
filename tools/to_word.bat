@echo off
REM Convert report chapters (Markdown) into one Word file. Requires pandoc: https://pandoc.org/installing.html
cd /d "%~dp0.."
pandoc report\00_introduction.md report\01_hazard.md report\02_exposure.md report\03_vulnerability.md report\04_strategy.md report\05_conclusion.md -f gfm+east_asian_line_breaks --resource-path=report --metadata-file=tools\metadata.yaml --reference-doc=tools\reference_zh.docx --toc -o report.docx
if errorlevel 1 (
  echo Conversion failed. Check that pandoc is installed and the file names are correct.
  pause
  exit /b 1
)
echo Done: report.docx
pause
