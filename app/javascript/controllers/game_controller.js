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

  dropPlayer(event) {
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
