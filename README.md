# Letter to a new landlord after foreclosure

A Massachusetts tenant can ask the new owner where to send rent and optionally report repairs. The scope is a completed foreclosure with a known recipient. The interview does not pay rent or stop an eviction.

Entry point: `docassemble.RentLetter:data/questions/rent_letter.yml`.

The revised letter collects names and addresses once, omits the repairs section when it does not apply, supports mail-only contact, and gives editable previews and print/sign/send instructions. Long descriptions expand in the DOCX instead of being cut off in PDF fields.

The original student work adapted MLRI's Conditions Rent Tender Letter (Form 26). The old direct PDF link now redirects to the form directory; the directory's PDF target returned 404 during review. The revised instructions were checked against the current January 2025 MassLegalHelp article, https://www.masslegalhelp.org/housing-apartments-shelter/foreclosure/what-do-first. This is an adapted letter, not a claim to reproduce a newly issued official PDF.

`LIST_topics` and legacy `tags` use `HO-08-06-00-00` (tenant options when a landlord is in foreclosure or bankruptcy), verified against taxonomy.legal's live feed retrieved November 22, 2026. Broader Housing tags are unnecessary; repair litigation and eviction-defense categories are not claimed.

Three ALKiln scenarios cover a bank owner with repairs, an individual owner without repairs or optional contact information, and an incomplete/uncertain foreclosure exit. The successful paths download PDFs and assert included and omitted content. Local testing artifacts are ignored. Print and sign the final letter; the tool does not transmit it.

Original student author: Angela, acorey2@suffolk.edu.

Run browser scenarios against a local installation with `python tests/run_alkiln.py .`. Set `ALKILN_PATH` if ALKiln is not at `~/ALKiln`. The runner reads local credentials without saving them in tracked files.
