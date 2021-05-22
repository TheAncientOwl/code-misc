#!/bin/sh
#_______________________[ Args check ]_______________________#
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 project-name git-repo create-directory"
  exit 1
fi

if ! [ -e "$3" ]; then
  echo "$3 is not a directory"
  exit 1
fi

#_______________________[ Script vars ]_______________________#
project_name="$1"
git_repo="$2"
create_directory="$3"

bold=`tput bold`
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

#_______________________[ Create-React-App ]_______________________#
echo "${bold}${red}>> create-react-app...${reset}"
cd $create_directory
npx create-react-app $project_name
cd $project_name
echo "${bold}${green}>> app created.${reset}"

#_______________________[ Clean project ]_______________________#
echo "${bold}${red}>> removing junk files...${reset}"
# >> remove files
rm public/robots.txt
rm public/index.html

rm src/App.js
rm src/App.css
rm src/App.test.js
rm src/index.css
rm src/logo.svg
rm src/reportWebVitals.js
rm src/setupTests.js
echo "${bold}${green}>> junk files removed.${reset}"

# >> create files
mkdir src/components

echo "${bold}${red}>> writting project files...${reset}"
touch src/App.js
cat > src/App.js <<- END
export default function App() {
  return (
    <div
      style={{
        textAlign: 'center',
        marginTop: '20x',
        fontSize: '25px',
      }}>
      ~ Hello world! ~
    </div>
  );
}
END

touch src/index.css
cat > src/index.css <<-END
::-webkit-scrollbar {
  display: none;
}
END

touch src/index.js
cat > src/index.js <<- END
import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';
import './index.css';

ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById('root')
);
END

touch public/index.html
cat > public/index.html <<- END
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <link rel="icon" href="%PUBLIC_URL%/favicon.ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#000000" />
    <meta name="description" content="Web site created using create-react-app" />
    <link rel="apple-touch-icon" href="%PUBLIC_URL%/logo192.png" />
    <link rel="manifest" href="%PUBLIC_URL%/manifest.json" />
    <title>React App</title>
  </head>
  <body>
    <noscript>You need to enable JavaScript to run this app.</noscript>
    <div id="root"></div>
  </body>
</html>
END
echo "${bold}${green}>> project files written.${reset}"

#_______________________[ Styled-Components ]_______________________#
echo "${bold}${red}>> installing styled-components...${reset}"
npm install --save styled-components
echo "${bold}${green}>> styled-components installed.${reset}"

#_______________________[ Prettier ]_______________________#
echo "${bold}${red}>> installing prettier...${reset}"
npm install eslint-config-prettier eslint-plugin-prettier prettier --save-dev
echo "${bold}${green}>> prettier installed.${reset}"

echo "${bold}${red}>> configuring prettier...${reset}"
touch .prettierrc.json
cat > .prettierrc.json <<- END
{
  "trailingComma": "es5",
  "tabWidth": 2,
  "semi": true,
  "singleQuote": true,
  "jsxSingleQuote": true,
  "bracketSpacing": true,
  "jsxBracketSameLine": true,
  "arrowParens": "avoid",
  "printWidth": 120,
  "htmlWhitespaceSensitivity": "ignore",
  "endOfLine": "auto"
}
END
echo "${bold}${green}>> prettier configured.${reset}"


#_______________________[ Eslint ]_______________________#
echo "${bold}${red}>> installing eslint...${reset}"
npm install eslint --save-dev
echo "${bold}${green}>> eslint installed.${reset}"

echo "${bold}${red}>> configuring eslint...${reset}"
touch .eslintrc.json
cat > .eslintrc.json <<- END
{
  "env": {
    "browser": true,
    "es2021": true,
    "jest": true
  },
  "extends": [
    "eslint:recommended",
    "plugin:react/recommended",
    "plugin:prettier/recommended"
  ],
  "parserOptions": {
    "ecmaFeatures": {
      "jsx": true
    },
    "ecmaVersion": 12,
    "sourceType": "module"
  },
  "plugins": ["react"],
  "rules": {
    "react/react-in-jsx-scope": "off"
  }
}
END
echo "${bold}${green}>> eslint configured.${reset}"

#_______________________[ Github ]_______________________#
echo "${bold}${red}>> setting up git & github...${reset}"
git init
git add .
git commit -m "first commit"
git branch -M main
git remote add origin $git_repo
git push -u origin main
echo "${bold}${green}>> finished git & github.${reset}"

echo ""
echo "${bold}${green}>> Project ready!.${reset}"
