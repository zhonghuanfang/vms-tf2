<template>
  <div>
    <svg-icon icon-class="question" @click="goto" />
  </div>
</template>

<script>
export default {
  name: 'VMSDoc',
  data() {
    return {
      url: 'http://doc.vms.vip/vms-vue'
    }
  },
  methods: {
    goto() {
      window.open(this.url)
    }
  }
}
</script>