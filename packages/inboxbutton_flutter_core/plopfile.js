module.exports = function (plop) {
  plop.setHelper('curly', function (open) {
    return open ? '{' : '}';
  });
  plop.setGenerator('model', {
    description:
      'A model for api',
    prompts: [
      {
            type: 'input',
            name: 'api',
            message: 'Name (e.g user)',
          },
      {
        type: 'input',
        name: 'model',
        message: 'Name (e.g getUserResponse,getUserRequest)',
      },
    ],
    actions: function (answers) {
      const actions = [];
        actions.push(
          {
            type: 'add',
            path: 'lib/client/{{snakeCase api}}/model/{{snakeCase model}}.dart',
            templateFile: 'plop-templates/flutter/data/dao/data_sources/remote/api.hbs',
          },
        );
      return actions;
    }
  });

};
