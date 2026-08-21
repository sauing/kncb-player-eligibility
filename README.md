# KNCB Player Eligibility

`kncb-player-eligibility` is a reusable Codex skill for assessing whether a player may represent a KNCB club team without prior dispensation under the 2026 KNCB Competition Rules.

It is designed for player eligibility, team movement, squad-list restrictions, seven-day restrictions, transfers, foreign participation and dispensation questions. It gives a documented rules assessment; it does **not** replace a formal decision by the KNCB Board.

## What you need

### Required input

Provide these four items for every ruling:

| Input | Required | Format | Example |
|---|---:|---|---|
| `player_profile_url` | Yes | KNCB Match Centre player URL for the relevant season | `https://matchcentre.kncb.nl/player/<PLAYER_ID>/21/` |
| `proposed_match_url` | Yes | KNCB Match Centre fixture or scorecard URL | `https://matchcentre.kncb.nl/match/<MATCH_ID>/scorecard/` |
| `proposed_team` | Yes | Club name and team number | `Eindhoven 3` |
| `match_date` | Yes | Day, month and four-digit year | `30 August 2026` |

### Additional information that may be required

Match Centre does not necessarily show every decisive fact. If known, also provide:

- an existing dispensation and its conditions;
- KNCB representative selection or replacement status;
- squad-list status for the relevant One-Day or T20 competition;
- participation for another Dutch club in this or either of the previous two seasons;
- participation for a foreign club, league or tournament during the Dutch season;
- whether an appearance was substitute-only;
- age or date of birth when a youth exception may apply;
- previous-season or established-lower-team playing history.

Do not guess these details. The skill is instructed to return `Insufficient information` and ask a targeted question whenever a missing fact could change the ruling.

## Installation

### Option A — copy the folder

Copy the complete `kncb-player-eligibility` folder into the Codex skills directory.

On Windows:

```text
%USERPROFILE%\.codex\skills\kncb-player-eligibility
```

On macOS or Linux:

```text
~/.codex/skills/kncb-player-eligibility
```

Restart Codex, or begin a new task, after installing the skill.

On Windows, you may instead run the included installer from PowerShell:

```powershell
.\install.ps1
```

On macOS or Linux:

```sh
sh ./install.sh
```

Both installers stop if the destination already exists. Use `-Force` with the
PowerShell installer or `--force` with the shell installer only when you
intentionally want to replace an earlier installation.

### Option B — install from GitHub

Ask Codex to install the skill directly from this public repository:

```text
Install $kncb-player-eligibility from:
https://github.com/sauing/kncb-player-eligibility
```

## How to use it

Explicit invocation is recommended for an important eligibility ruling:

```text
Use $kncb-player-eligibility.

Player profile: <PLAYER_PROFILE_URL>
Proposed match: <MATCH_URL>
Proposed team: <CLUB_AND_TEAM_NUMBER>
Match date: <DAY MONTH YEAR>

Determine whether the player may play without dispensation.
Quote the exact controlling article, paragraph and material Dutch wording.
Do not presume any missing fact; ask me if something decisive cannot be verified.
```

You can also ask a normal eligibility question without naming the skill. Automatic skill selection is enabled, although explicit invocation removes ambiguity.

## Copy-and-paste examples

### Example 1 — proposed Eindhoven 3 appearance

```text
Use $kncb-player-eligibility.

Player profile:
https://matchcentre.kncb.nl/player/<PLAYER_ID>/21/

Proposed match:
https://matchcentre.kncb.nl/match/<MATCH_ID>/scorecard/

Proposed team: Eindhoven 3
Match date: 30 August 2026

Does this player require dispensation? Verify all relevant current-season
appearances, whether the toss occurred, Article 22 thresholds, Article 24's
seven-calendar-day restriction and any Article 20 squad-list restriction.
Give the exact controlling article, paragraph and material Dutch wording.
Ask me a targeted question instead of presuming any missing decisive fact.
```

### Example 2 — movement between two teams in the same division

```text
Use $kncb-player-eligibility.

Player profile: <PLAYER_PROFILE_URL>
Proposed match: <MATCH_URL>
Proposed team: Eindhoven 4
Match date: <MATCH_DATE>

The player has appeared for Eindhoven 3 this season. Check the special
same-division rule, the seven-day rule and every other independent eligibility
restriction. Show which appearances count and why.
```

### Example 3 — foreign-club participation

```text
Use $kncb-player-eligibility.

Player profile: <PLAYER_PROFILE_URL>
Proposed match: <MATCH_URL>
Proposed team: <TEAM>
Match date: <MATCH_DATE>

Additional fact: the player represented <FOREIGN CLUB> in <LEAGUE OR
TOURNAMENT> on <DATE>. Determine whether Article 25 requires prior
dispensation before the player returns to KNCB competition.
```

### Example 4 — checking an existing dispensation

```text
Use $kncb-player-eligibility.

Player profile: <PLAYER_PROFILE_URL>
Proposed match: <MATCH_URL>
Proposed team: <TEAM>
Match date: <MATCH_DATE>

Existing dispensation:
- competition: <ONE-DAY OR T20>
- destination team: <TEAM>
- effective date: <DATE>
- conditions: <CONDITIONS>
- later appearances after it was granted: <LIST OR NONE>

Check whether this dispensation applies and whether it has lapsed.
```

## Understanding the result

The answer begins with one of three statuses:

- `Eligible without dispensation` — no identified applicable restriction requires dispensation, based on verified facts.
- `Dispensation required` — at least one applicable rule requires prior KNCB approval.
- `Insufficient information` — a decisive fact cannot be verified and must be supplied.

The assessment should then include:

1. the player, proposed team, competition and match date;
2. the relevant appearances and calculation;
3. every independently applicable article and paragraph;
4. brief material wording checked against the controlling Dutch rules;
5. application route and deadline when dispensation is required;
6. consequences of playing an ineligible player.

An application does not make a player eligible. The player becomes eligible only after the KNCB has granted dispensation that applies to the player, team, competition and effective date.

## Important limitations

- The Dutch `Competitiereglement 2026` controls if it differs from the English translation.
- One-Day and T20 are separate competitions for these assessments.
- Match Centre pages can be incomplete or unavailable, so additional documents or answers may be necessary.
- Rules, playing conditions, squad lists and KNCB Board decisions can change during the season.
- Immigration, employment and tax questions require current advice from the appropriate authorities.
- This project is an independent aid and is not affiliated with or endorsed by KNCB.

## Keeping it current

This release is for the **2026 season**. Before using it for a later season:

1. replace all official rules links with the new season's documents;
2. compare eligibility and dispensation articles line by line;
3. update scheduled-match baselines and competition structures;
4. update `references/kncb-2026-rules-context.md` or create a new season reference;
5. change the skill description and release version;
6. validate the skill and record changes in `CHANGELOG.md`.

## Repository contents

```text
kncb-player-eligibility/
|-- SKILL.md
|-- README.md
|-- CHANGELOG.md
|-- LICENSE
|-- VERSION
|-- install.ps1
|-- install.sh
|-- agents/
|   `-- openai.yaml
`-- references/
    `-- kncb-2026-rules-context.md
```

## Reporting an issue

When reporting a suspected incorrect ruling, include the player-profile URL, proposed-match URL, proposed team, match date, the answer received and the article you believe was applied incorrectly. Do not publish private correspondence, identity documents or immigration/employment records.

