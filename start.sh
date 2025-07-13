  GNU nano 6.2                                                               docker-entrypoiint.sh
#!/bin/sh

echo "🔧 Running Medusa migrations..."
yarn predeploy || true

if [ -n "$ADMIN_EMAIL" ] && [ -n "$ADMIN_PASSWORD" ]; then
  echo "👤 Creating Medusa admin user..."
  npx medusa user -e "$ADMIN_EMAIL" -p "$ADMIN_PASSWORD" || true
else
  echo "⚠️ Skipping admin user creation — ADMIN_EMAIL or ADMIN_PASSWORD not set"
fi

echo "🚀 Starting Medusa backend server..."
yarn start