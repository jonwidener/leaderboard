import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="game"
export default class extends Controller {
  static targets = [
    'player',
    'players',
    'gamePlayers',
    'availablePlayers',
    'winner',
  ];

  connect() {
    this.players = new Set();
  }

  clickPlayer(event) {
    const { id } = event.params;

    if (this.players.has(id)) {
      this.winnerTarget.value = id;

      this.playerTargets.forEach((player) => {
        player.style.border = '';
      });

      event.target.style.border = '2px solid blue';
    }
  }

  dragPlayer(event) {
    if (event.x == 0 && event.y == 0) {
      return;
    }
    const el = event.target;
    el.style.position = 'fixed';
    el.style.top = Math.round(event.y - el.width / 2) + 'px';
    el.style.left = Math.round(event.x - el.height / 2) + 'px';
    el.style.zIndex = '100';
  }

  dragendPlayer(event) {
    const { id } = event.params;
    const el = event.target;

    const dropElement = document
      .elementsFromPoint(event.x, event.y)
      .find((el) => el.getAttribute('data-game-target') === 'gamePlayers');

    if (dropElement === this.gamePlayersTarget) {
      this.gamePlayersTarget.appendChild(el);

      this.players.add(id);

      this.playersTarget.value = JSON.stringify(Array.from(this.players));
    } else {
      if (this.players.has(id)) {
        this.players.delete(id);
      }
      this.availablePlayersTarget.appendChild(el);
      event.target.style.border = '';
    }

    el.style.position = 'relative';
    el.style.top = '';
    el.style.left = '';
    el.style.display = '';
    el.style.zIndex = '';
  }
}
