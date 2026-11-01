
# Lottery Number Patterns and Randomness

**Tools:** Python

## Overview

This project examines New York lottery winning numbers to explore whether numbers in Mega Millions, Powerball, and Pick 10 are drawn evenly, highlighting "hot" and "cold" numbers within each game.

## Objective

Determine whether winning-number frequencies follow the even distribution expected from a random drawing, and identify numbers that appear more or less often than expected within each game.

## Data

Three public datasets from the New York State Open Data portal ([data.ny.gov](https://data.ny.gov)):

- `Lottery_Mega_Millions_Winning_Numbers__Beginning_2002_20240421.csv`: 2,285 drawings (May 2002 to April 2024). Five winning numbers plus a separate Mega Ball and multiplier.
- `Lottery_Powerball_Winning_Numbers__Beginning_2010_20240421.csv`: 1,617 drawings (February 2010 to April 2024). Six numbers per drawing (five winning numbers plus the Powerball) and a multiplier.
- `Lottery_Pick_10_Winning_Numbers__Beginning_1987_20240421.csv`: 13,570 drawings (January 1987 to April 2024). Twenty numbers drawn from 1 to 80 per drawing.

Winning numbers are stored as space-separated text and must be split into individual numbers for analysis. Multiplier values are missing for some drawings, but they are not used in the frequency analysis.

## Methodology

The original analysis used visualizations to examine winning-number distributions. The analysis will be rebuilt in Python using the following methods:

- Split each drawing's winning numbers into individual values.
- Count how often each number was drawn, overall and within each game.
- Compare observed frequencies against an even (expected) distribution.
- Examine frequencies by drawing position and by year.
- Visualize patterns using a frequency histogram, small multiples by game, an expected-versus-observed comparison, a density plot by position, an area chart of draw volume, and a single-game scatterplot.

## Key Findings

- Number frequencies were not evenly distributed in Mega Millions and Powerball, with lower numbers appearing more often than higher numbers.
- Each game showed its own distinct set of "hot" and "cold" numbers.
- Pick 10 accounts for far more drawn numbers than the other two games (20 numbers per drawing over more than 35 years), so combined totals can hide game-specific patterns unless each game is analyzed separately.

## Practical Application

The analysis shows how frequency comparisons and visual storytelling can test whether a process behaves as expected, and why results should be broken out by group before drawing conclusions.

## Ethical Considerations

- The data comes from an official public source (data.ny.gov) and was used unaltered, so results can be independently verified.
- The analysis assumes the published drawing records are complete and accurate.
- Findings could be misused to encourage gambling or to suggest that certain numbers improve the odds of winning. This analysis is for educational purposes only and does not offer a winning strategy.

## Limitations

- Mega Millions and Powerball have changed their number ranges over time, so not every number was eligible in every drawing. Frequencies should be compared within periods that share the same number range.
- The Powerball dataset combines the bonus ball with the five main numbers, and the bonus ball is drawn from a smaller range. Separating it from the main numbers is necessary for a fair comparison.
- Winning numbers are recorded in ascending order, which affects position-based comparisons.
- Uneven frequencies alone do not prove a drawing is non-random; formal statistical testing is needed to confirm whether differences exceed what chance would produce.

## Project Files

Analysis code, visualizations, and supporting documentation will be added as the portfolio develops.
