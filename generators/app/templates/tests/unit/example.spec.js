// Import the `mount()` method from the test utils
// and the component you want to test
import { shallow, mount } from '@vue/test-utils'
import App from '../../src/js/app.vue'

describe('Testing Sidebar', () => {
  // Now mount the component and you have the wrapper
  const wrapper = mount(App)

  it('App is available', () => {
    expect(wrapper.html())
  })

  it('Data is there', () => {
    expect(wrapper.vm.message).toBe('Hello World i am Vue')
  })

  it('render the right markup', () => {
    expect(wrapper.html()).toBe('<h2>Hello World i am Vue</h2>')
  })
})
