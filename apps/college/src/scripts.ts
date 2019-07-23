function actionCall(path: string) {
  document.dispatchEvent(new CustomEvent('FlashNav', { detail: path }));
}
