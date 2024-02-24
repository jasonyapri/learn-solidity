// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "./Hero.sol";

// TODO: create Mage/Warrior Heroes
contract Mage is Hero(50) {
    function attack(Enemy enemy) override public {
        enemy.takeAttack(AttackTypes.Spell);
    }
}

contract Warrior is Hero(200) {
    function attack(Enemy enemy) override public {
        enemy.takeAttack(AttackTypes.Brawl);
    }
}