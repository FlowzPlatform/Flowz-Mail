'use strict'
module.exports = {
  NODE_ENV: '"production"',
  loginURL: JSON.stringify(process.env.loginURL) || JSON.stringify('https://auth.flowz.com/api'),
  microURL: JSON.stringify(process.env.microUrl) || JSON.stringify('http://localhost:3003'),
  serverURL: JSON.stringify(process.env.serverBaseUrl) || JSON.stringify('http://localhost:3036'),
  socketUrl: JSON.stringify(process.env.socketUrl) || JSON.stringify('http://localhost:3036'),
  loginWithGoogleUrl: JSON.stringify(process.env.loginWithGoogleUrl) || JSON.stringify('https://auth.flowz.com/auth/Gplus'),
  loginWithFacebookUrl: JSON.stringify(process.env.loginWithFacebookUrl) || JSON.stringify('https://auth.flowz.com/auth/facebook'),
  loginWithTwitterUrl: JSON.stringify(process.env.loginWithTwitterUrl) || JSON.stringify('https://auth.flowz.com/auth/twitter'),
  loginWithGithubUrl: JSON.stringify(process.env.loginWithGithubUrl) || JSON.stringify('https://auth.flowz.com/auth/github'),
	callbackUrl: JSON.stringify(process.env.callbackUrl) || JSON.stringify('http://localhost:8080')
}
