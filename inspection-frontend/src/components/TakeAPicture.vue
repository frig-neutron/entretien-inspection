<template>
  <div class="camera">
    <video id="video" @click="takeAPicture" :class="imageControl.show">Video stream not available</video>
    <canvas id="canvas" @click="copyCanvasToImg" @mousedown="setTargetReticle" :class="imageControl.show"/>
    <span v-if="imageControl.show === 'video'">Tap video to take picture</span>
    <button v-if="imageControl.show === 'img'" @click="retakePicture">Retake image</button>
    <img id="photo" alt="where da pic goes"/>
  </div>

  <div class="output">
  </div>
</template>

<script>
export default {
  name: "TakeAPicture",
  data() {
    return {
      width: 320,    // We will scale the photo width to this
      height: 0,     // computed based on the input stream

      streaming: false,

      video: null,
      canvas: null,
      canvasImageData: null,
      photo: null,
      startButton: null,

      imageControl: {
        show: "video" // options are video,still
      }
    }
  },
  methods: {
    startStreaming(ev) {
      if (!this.streaming) {
        this.setWidthHeight(this.video)
        this.setWidthHeight(this.canvas)
        this.streaming = true
      }
    },
    takeAPicture() {
      let ctx = this.canvas.getContext('2d');
      if (this.width && this.height) {
        this.canvas.width = this.width;
        this.canvas.height = this.height;
        ctx.drawImage(this.video, 0, 0, this.width, this.height);
        this.canvasImageData = ctx.getImageData(0, 0, this.width, this.height)
        this.imageControl.show = 'img'
      }
    },
    retakePicture(){
      this.imageControl.show = 'video'
    },
    setTargetReticle(ev) {
      let x = ev.offsetX;
      let y = ev.offsetY;
      let ctx = this.canvas.getContext('2d');

      ctx.putImageData(this.canvasImageData, 0, 0)

      ctx.beginPath();
      ctx.strokeStyle = 'red';
      ctx.lineWidth = 3
      ctx.arc(x, y, 20, 0, 180)
      ctx.stroke();
    },
    copyCanvasToImg() {
      let data = this.canvas.toDataURL('image/png');
      this.photo.setAttribute('src', data);
    },
    setWidthHeight(element) {
      this.height = this.video.videoHeight / (this.video.videoWidth / this.width)
      element.setAttribute('width', this.width)
      element.setAttribute('height', this.height)
    },
  },
  mounted() {
    this.video = document.getElementById("video")
    this.canvas = document.getElementById("canvas")
    this.photo = document.getElementById("photo")
    this.startButton = document.getElementById("startbutton")

    let startStreamingHook = ev => this.startStreaming(ev)
    navigator.mediaDevices.getUserMedia({video: {facingMode: "environment"}, audio: false})
             .then(function (stream) {
               video.srcObject = stream;
               video.addEventListener('canplay', startStreamingHook, false)
               video.play();
             })
             .catch(function (err) {
               alert(err)
             })
  }
}
</script>

<style scoped>
video {
  display: block;
}

video.img {
  display: none;
}

canvas {
  cursor: crosshair;
  display: block;
}

canvas.video {
  display: none;
}

img#photo {
  display: block;
}

</style>
