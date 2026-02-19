function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    baseUrl: 'https://gorest.co.in/public/v2',
    token: '68a45b1e1d0ad1ac521b19c6e0725c4a22c7a57efe607936d45811e49361f809'
  }
  if (env == 'dev') {
    // customize
    // var baseurl = 'http://localhost:8080';
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}
