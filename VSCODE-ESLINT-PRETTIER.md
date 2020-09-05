
# Installing ESLint + Prettier for VSCode Proejcts

1. Install ESLint && Prettier VSCode Extensions
2. CMD , -> Preferences -> set things up and stuff using search
3. Install this locally in your repo if you want as dev dependencies:
   > `npm i -D eslint prettier eslint-plugin-prettier eslint-config-prettier eslint-plugin-node eslint-config-node`
4. Use Airbnb rules. Execute the cmd/binary and also install its peer deps:
   > `npx install-peerdeps --dev eslint-config-airbnb`
5. create config files in VSCode as run command files.
5a. Prettier: at project root, create .prettierrc and add in rules as JSON objects.
5b. ESLint: You can either manually create .eslint.rc.json or similar (reliant on
several params such as your babel config and stuffs), or install ESLint globally
and have the global install then generate your file:
   > `sudo npm install -g eslint`

   > `eslint --init`

- For ES6/React/Vue projects, choose JavaScript import/export
- For Node projects, choose CommonJS require/export
- Choose Airbnb style

6. After ESLint generates the file, make it so that .eslint.rc.json only has
  the following (so you can use Prettier and ESLint together!):
  ... the following example has just a couple rules.
      ```
      {
      "extends": ["airbnb", "prettier"],
      "plugins": ["prettier"],
      "rules": {
        "prettier/prettier": "error",
        "no-unused-vars": "warn",
        "no-console": "error"
      }
      }
      ```

... Now your files should work just fine for standard linting.

- More on integration here: https://prettier.io/docs/en/integrating-with-linters.html
Note that you may need to edit VSCode .editorconfig and integrate.
- See info here: https://prettier.io/docs/en/integrating-with-linters.html
- See also: https://github.com/prettier/prettier-vscode#linter-integration