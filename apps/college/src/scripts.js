/**
 * @param path {string}
 */
function actionCall(path) {
  document.dispatchEvent(new CustomEvent('FlashNav', { detail: path }));
}
