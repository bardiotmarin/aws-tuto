<p align="center">
  <a href="http://nestjs.com/" target="blank"><img src="https://nestjs.com/img/logo-small.svg" width="120" alt="Nest Logo" /></a>
</p>

[circleci-image]: https://img.shields.io/circleci/build/github/nestjs/nest/master?token=abc123def456
[circleci-url]: https://circleci.com/gh/nestjs/nest

  <p align="center">A progressive <a href="http://nodejs.org" target="_blank">Node.js</a> framework for building efficient and scalable server-side applications.</p>
    <p align="center">
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/v/@nestjs/core.svg" alt="NPM Version" /></a>
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/l/@nestjs/core.svg" alt="Package License" /></a>
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/dm/@nestjs/common.svg" alt="NPM Downloads" /></a>
<a href="https://circleci.com/gh/nestjs/nest" target="_blank"><img src="https://img.shields.io/circleci/build/github/nestjs/nest/master" alt="CircleCI" /></a>
<a href="https://discord.gg/G7Qnnhy" target="_blank"><img src="https://img.shields.io/badge/discord-online-brightgreen.svg" alt="Discord"/></a>
<a href="https://opencollective.com/nest#backer" target="_blank"><img src="https://opencollective.com/nest/backers/badge.svg" alt="Backers on Open Collective" /></a>
<a href="https://opencollective.com/nest#sponsor" target="_blank"><img src="https://opencollective.com/nest/sponsors/badge.svg" alt="Sponsors on Open Collective" /></a>
  <a href="https://paypal.me/kamilmysliwiec" target="_blank"><img src="https://img.shields.io/badge/Donate-PayPal-ff3f59.svg" alt="Donate us"/></a>
    <a href="https://opencollective.com/nest#sponsor"  target="_blank"><img src="https://img.shields.io/badge/Support%20us-Open%20Collective-41B883.svg" alt="Support us"></a>
  <a href="https://twitter.com/nestframework" target="_blank"><img src="https://img.shields.io/twitter/follow/nestframework.svg?style=social&label=Follow" alt="Follow us on Twitter"></a>
</p>
  <!--[![Backers on Open Collective](https://opencollective.com/nest/backers/badge.svg)](https://opencollective.com/nest#backer)
  [![Sponsors on Open Collective](https://opencollective.com/nest/sponsors/badge.svg)](https://opencollective.com/nest#sponsor)-->

## Description

[Nest](https://github.com/nestjs/nest) framework TypeScript starter repository.

## Project setup

```bash
$ npm install
```

## Compile and run the project

```bash
# development
$ npm run start

# watch mode
$ npm run start:dev

# production mode
$ npm run start:prod
```

## Run tests

```bash
# unit tests
$ npm run test

# e2e tests
$ npm run test:e2e

# test coverage
$ npm run test:cov
```

## Deployment

#### Déploiement "à la main"
```bash
# Build and launch the application
docker build . -t demo-aws-app-runner:latest
# If you are on ARM (ex.: mac M1) then specify platform with --platform linux/amd64 option
docker run -p 8080:80 demo-aws-app-runner:latest

# On an other terminal
curl localhost:8080
# You should get the response > Hello World!

# Create an AWS ECR Repository on the France (Paris) region
aws ecr create-repository --repository-name demo-aws-app-runner --region eu-west-3

# Connect to the repository
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
aws ecr get-login-password --region eu-west-3 | docker login --username AWS --password-stdin ${ACCOUNT_ID}.dkr.ecr.eu-west-3.amazonaws.com


# Push the docker image
docker tag demo-aws-app-runner:latest ${ACCOUNT_ID}.dkr.ecr.eu-west-3.amazonaws.com/demo-aws-app-runner:latest
docker push ${ACCOUNT_ID}.dkr.ecr.eu-west-3.amazonaws.com/demo-aws-app-runner:latest
```
1. Rendez-vous sur https://eu-west-3.console.aws.amazon.com/apprunner/home?region=eu-west-3#/services
2. "Créer"
3. Vous devriez avoir l'interface suivante :
![image](/readme/aws-app-service.png)
4. Source : Sélectionnez l'URI de l'image de conteneur via Parcourir
5. Déclencheur de déploiement "Automatique"
6. Rôle d'accès ECR "Créer un nouveau rôle de service"
7. "Suivant"
8. Donnez un nom au service (ex. : demo-aws-app-runner)
9. Sélectionnez le port 3000
10. "Suivant"
11. "Créer et déployer"
12. Rendez-vous sur l'URL "Domaine par défaut" quand le déploiement sera terminé

#### Déploiement automatique
1. Créer une clé d'accès AWS dans compte (en haut à droite d'AWS console) -> Informations d'identification et sécurité
2. Créer un répertoire [GitHub](https://github.com)
3. Dans Settings -> Secrets and variables -> Actions :
Ajoutez les variables d'environnement :
```
AWS_ACCESS_KEY_ID=<your-aws-access-key-id>
AWS_SECRET_ACCESS_KEY=<your-aws-secret-access-key>
AWS_ACCOUNT_ID=<your-aws-account-id>
AWS_REGION=eu-west-3
```
4. Poussez le répertoire
```bash
git branch -M main
git remote add origin <your-repository>
git push -u origin main
```
5. Dans Actions : attendre la fin du déploiement
6. Sur [App Runner](https://eu-west-3.console.aws.amazon.com/apprunner/home?region=eu-west-3#/services), cliquer sur votre service puis "deployer"
7. Visiter l'URL, le site s'est déployé avec la dernière image du registre ECR

## Resources

Check out a few resources that may come in handy when working with NestJS:

- Visit the [NestJS Documentation](https://docs.nestjs.com) to learn more about the framework.
- For questions and support, please visit our [Discord channel](https://discord.gg/G7Qnnhy).
- To dive deeper and get more hands-on experience, check out our official video [courses](https://courses.nestjs.com/).
- Deploy your application to AWS with the help of [NestJS Mau](https://mau.nestjs.com) in just a few clicks.
- Visualize your application graph and interact with the NestJS application in real-time using [NestJS Devtools](https://devtools.nestjs.com).
- Need help with your project (part-time to full-time)? Check out our official [enterprise support](https://enterprise.nestjs.com).
- To stay in the loop and get updates, follow us on [X](https://x.com/nestframework) and [LinkedIn](https://linkedin.com/company/nestjs).
- Looking for a job, or have a job to offer? Check out our official [Jobs board](https://jobs.nestjs.com).

## Support

Nest is an MIT-licensed open source project. It can grow thanks to the sponsors and support by the amazing backers. If you'd like to join them, please [read more here](https://docs.nestjs.com/support).

## License

Nest is [MIT licensed](https://github.com/nestjs/nest/blob/master/LICENSE).
