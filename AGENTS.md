# AGENTS.md

## Using this SDK in your project

If you are writing code that integrates Online Payments with this SDK, read the agent skill
for this SDK version first and use the code it shows. Do not write SDK calls from memory.

- In this gem: `skills/online-payments/SKILL.md`
  (gem folder: `bundle info onlinepayments-sdk-ruby --path`)
- Online: https://raw.githubusercontent.com/Online-Payments/sdk-ruby/12.0.0/skills/online-payments/SKILL.md

The skill matches SDK version 12.0.0. If your installed version is different, use the skill
from your installed gem.

## Working on this SDK

- SDK source: `lib/onlinepayments/sdk/`; unit tests: `spec/lib/`; integration tests: `spec/integration/`.
- Install the dependencies with `bundle install`.
- Run the unit tests with `bundle exec rake unit`, the integration tests with `bundle exec rake integration`, and both
  with `bundle exec rake spec`. Check the code style with `bundle exec rake rubocop`.
- The integration tests need the environment variables `ONLINEPAYMENTS_API_KEY_ID`, `ONLINEPAYMENTS_SECRET_API_KEY`
  and `ONLINEPAYMENTS_MERCHANT_ID` (optionally `ONLINEPAYMENTS_API_ENDPOINT`); they are skipped when one is missing.
  Copy `.env.example` to `.env` to set them; the integration tests load it automatically.
- Generate the documentation with `bundle exec rake yard` (output in `doc/`).
- See `README.md` for details.
