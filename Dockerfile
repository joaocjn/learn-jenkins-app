FROM mcr.microsoft.com/playwright:v1.46.1-jammy
RUN npm install -g netlify-cli node-jq serve
RUN npx playwright install