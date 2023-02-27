IF EXIST ".env" (
  echo .env already exists
) ELSE (
  copy .env.example .env
)
npm install
