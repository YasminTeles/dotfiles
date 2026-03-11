/**
 * Simple script to generate a formatted announcement for Slack.
 * Usage: node generate-announcement.cjs --name "Release Name" --purpose "Purpose" --impact "Impact" --availability "GA" --links "Link1,Link2"
 */

const args = process.argv.slice(2);
const params = {};

for (let i = 0; i < args.length; i++) {
  if (args[i].startsWith('--')) {
    const key = args[i].substring(2);
    const value = args[i + 1];
    params[key] = value;
    i++;
  }
}

const required = ['name', 'purpose', 'impact', 'availability'];
const missing = required.filter(key => !params[key]);

if (missing.length > 0) {
  console.error(`Error: Missing required parameters: ${missing.join(', ')}`);
  process.exit(1);
}

const links = params.links ? params.links.split(',').map(link => link.trim()) : [];

const announcement = `*Release Name:* ${params.name}
*Purpose:* ${params.purpose}
*Impact:* ${params.impact}
*Availability:* ${params.availability}
*Team:* Cloud Insights Foundation
*Useful Links:* ${links.join(', ')}`;

console.log('--- SLACK ANNOUNCEMENT START ---');
console.log(announcement);
console.log('--- SLACK ANNOUNCEMENT END ---');
