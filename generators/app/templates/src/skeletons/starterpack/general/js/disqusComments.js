/**
 * Disqus Loader
 * @param element (string) =
 */
export default function(element) {
  const trigger = document.querySelector(element)

  if (trigger !== null) {
    // Get Disqus name from Element
    const name = trigger.getAttribute('data-disqus-name')

    // Watch Trigger for click
    trigger.addEventListener('click', () => {
      const scriptElement = document.createElement('script')

      // Inject Script Load
      scriptElement.type = 'text/javascript'
      scriptElement.async = true
      scriptElement.src = `https://${name}.disqus.com/embed.js`
      document.getElementsByTagName('head')[0].appendChild(scriptElement)

      // Hide Trigger
      trigger.style.display = 'none'
    })
  }
}
