const Migrations = artifacts.require("tes");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
};
