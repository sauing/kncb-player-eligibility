---
name: kncb-player-eligibility
description: Determine whether a player may represent a KNCB club team without dispensation, especially for Eindhoven teams, from a player-profile URL and proposed-match URL. Use for KNCB eligibility, team movement, squad-list, seven-day restriction, foreign-participation, transfer, or dispensation questions under the 2026 Competition Rules. Do not use for ordinary cricket-law decisions unrelated to player eligibility.
---

# KNCB Player Eligibility

Give a documented rules assessment, not an official KNCB ruling. The KNCB Board alone grants or rejects dispensation.

## Sources and authority

Read [references/kncb-2026-rules-context.md](references/kncb-2026-rules-context.md) for every eligibility or dispensation case. When exact language or surrounding context is needed, open the relevant pages of the official Dutch and English PDFs linked below.

The official Dutch `Competitiereglement 2026` controls whenever it differs from the English translation:

- Dutch: https://kncb.nl/downloads/2026-competitiereglement.pdf
- English: https://kncb.nl/downloads/2026-competition-rules.pdf
- Current regulations and incorporated manuals: https://kncb.nl/kennisloket-reglementen

For a disputed phrase, paragraph number, translation issue, or application form, verify the current Dutch source. Check current KNCB announcements where an in-season decision may affect the match.

## Required case facts

Obtain and verify:

- player profile URL;
- proposed match URL, destination team, competition and match date;
- every relevant current-season appearance, including date, team, division, format and whether the toss occurred;
- pre-season scheduled-match count for every team used in a threshold calculation;
- whether any appearance was substitute-only;
- appearances within the seven calendar days preceding the proposed match;
- squad-list status for the same competition;
- current/prior club membership and transfer history when relevant;
- KNCB selection call-up/replacement status and required notifications;
- foreign-club league or tournament participation during the KNCB season;
- existing dispensation, including team, competition, effective date, conditions and possible lapse;
- age and prior-season/lower-team history if an exception depends on them.

Do not presume a fact that changes eligibility. If it cannot be established from authoritative records, ask the user a targeted question and return `insufficient information` for that branch.

## Verification workflow

1. Inspect the rendered Match Centre player and match pages. They are JavaScript-driven; use an applicable connector/API if available, otherwise use the browser skill.
2. Separate One-Day, T20, recreational and friendly appearances. One-Day and T20 are independent competitions.
3. Treat a match as counted under Articles 22 or 23 only when a toss occurred. Do not count substitute-only fielding.
4. Determine the proposed destination's relative team number and division. Check whether the club has multiple teams in the same division.
5. Test all applicable rules independently. Eligibility is their intersection; passing one article does not displace another.
6. Verify the paragraph numbering and controlling Dutch wording before quoting it.

At minimum, consider:

- Article 14: registration, exact identity, one-club-per-competition and Match Day limits;
- Article 16: transfers between clubs;
- Article 17: men's THE squad lists;
- Article 18: KNCB-selection replacements and promotion decision match;
- Article 18B: Player Points cap for men's THE teams;
- Article 20: THE squad-listed players moving into men's Lower Divisions and its exceptions;
- Article 21: men's Recreational One-Day treatment;
- Article 22: movement between men's One-Day teams;
- Article 23: movement between men's T20 teams;
- Article 24: seven-calendar-day restriction, including lower-division and same-division variants;
- Article 25: foreign-club competition/tournament participation;
- Article 26: Designated Player rules;
- Article 28: application requirements and lapse of dispensation;
- Article 29: consequences of ineligibility.

## Eindhoven 2026 baseline

Use these only after confirming the competition pages have not changed:

- Eindhoven 2: men's One-Day Tweede Klasse; 14 pre-season scheduled matches; ordinary Article 22 threshold is 7.
- Eindhoven 3 and Eindhoven 4: men's One-Day Vierde Klasse, pool 4E; 18 scheduled matches each.
- Because Eindhoven 3 and Eindhoven 4 are two teams from the same club in the same division, Article 22's special same-division rule can apply when moving between them.

Do not infer Eindhoven 1's division, squad lists, or a player's status from these facts.

## Ruling format

Lead with exactly one status:

- `Eligible without dispensation`
- `Dispensation required`
- `Insufficient information`

Then state:

1. proposed player, team, match date and competition;
2. verified relevant appearances and the calculation;
3. each independently applicable article, chapter and paragraph;
4. the exact material wording, quoted briefly and checked against Dutch when necessary;
5. how the facts satisfy or fail each condition;
6. unresolved facts and targeted questions;
7. application route and deadline if dispensation is required;
8. consequences of playing without granted dispensation.

Distinguish clearly between:

- the rule that creates the restriction;
- the paragraph permitting a reasoned application;
- Article 28's procedure; and
- Article 29's sanctions.

Never state that an application itself makes a player eligible. Eligibility begins only if dispensation has actually been granted and applies to that player, team, competition and date.

