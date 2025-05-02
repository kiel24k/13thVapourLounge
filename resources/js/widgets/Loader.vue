<template>
   <div id="loader">
    <div>
  
        <span>↓</span>
        <span style="--delay: 0.1s">↓</span>
        <span style="--delay: 0.3s">↓</span>
        <span style="--delay: 0.4s">↓</span>
        <span style="--delay: 0.5s">↓</span>
        
      </div>
   </div>
</template>

<style scoped>
#loader{
    position: fixed;
    z-index: 999;
    width: 100%;
    height: 100%;
    background: white;
}
div {
    display: flex;
    height: 100vh;
    align-items: center;
    justify-content: center;
 

  }
  
  @keyframes arrows {
    0%,
    100% {
      color: black;
      transform: translateY(0);
    }
    50% {
      color: #3AB493;
      transform: translateY(20px);
    }
  }
  
  span {
    --delay: 0s;
    animation: arrows 1s var(--delay) infinite ease-in;
  }
</style>