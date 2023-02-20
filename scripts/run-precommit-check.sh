
#!/bin/sh
npm run yaml:lint 
npm run prettier:check
npm run markdown:check
npm run terraform:tfsec:static
npm run terraform:infracost