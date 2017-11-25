function actionCall(path) {
	let flashNav = new CustomEvent('FlashNav', { detail: path });
	document.dispatchEvent(flashNav);
}