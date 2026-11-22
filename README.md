# Letter to a new landlord after foreclosure

A Massachusetts tenant can ask the new owner where to send rent and optionally report repairs. The scope is a completed foreclosure with a known recipient. The interview does not pay rent or stop an eviction.

Entry point: `docassemble.RentLetter:data/questions/rent_letter.yml`.

The revised letter collects names and addresses once, omits the repairs section when it does not apply, supports mail-only contact, and gives editable previews and print/sign/send instructions. Long descriptions expand in the DOCX instead of being cut off in PDF fields.

The original student work adapted MLRI's Conditions Rent Tender Letter (Form 26). The old direct PDF link now redirects to the form directory; the directory's PDF target returned 404 during review. The revised instructions were checked against the current January 2025 MassLegalHelp article, https://www.masslegalhelp.org/housing-apartments-shelter/foreclosure/what-do-first. This is an adapted letter, not a claim to reproduce a newly issued official PDF.

`LIST_topics` and legacy `tags` use `HO-08-06-00-00` (tenant options when a landlord is in foreclosure or bankruptcy), verified against taxonomy.legal's live feed retrieved November 22, 2026. Broader Housing tags are unnecessary; repair litigation and eviction-defense categories are not claimed.

Three ALKiln scenarios cover a bank owner with repairs, an individual owner without repairs or optional contact information, and an incomplete/uncertain foreclosure exit. The successful paths download PDFs and assert included and omitted content. Local testing artifacts are ignored. Print and sign the final letter; the tool does not transmit it.

Original student author: Angela, acorey2@suffolk.edu.

## Browser tests

Use the standard [ALKiln setup](https://assemblyline.suffolklitlab.org/docs/components/ALKiln/setup/). The `ALKiln interview tests` GitHub workflow starts an isolated sandbox, runs ALKiln, and uploads its reports. Run it manually from Actions after the workflow is on the default branch, selecting the branch to test. No local credential file or custom runner is needed. Tests can also run with ALKilnInThePlayground as described in the setup guide.

The three scenarios use built-in ALKiln steps only. Two compare downloaded PDFs with synthetic-data baselines in `data/sources`; the third checks the early exit. Baseline comparison uses ALKiln's text/field comparison, not a visual match. Keep the fixed story values and dates aligned with the baselines. Review any baseline change as carefully as a form change.

The mobile step selects ALKiln's mobile mode; it does not assert an exact 390px width. After copy or layout changes, manually check a narrow phone view. Also test changing answers from the download page, then download again and confirm the new PDF replaces the old values. These are manual checks, not claims made by the three standard scenarios. Prior local browser results used a temporary custom harness that has been removed; rerun the standard workflow for current runtime evidence.

For the edit check, remove the repair section and confirm it is absent from the new PDF.
