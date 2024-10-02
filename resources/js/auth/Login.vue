<script setup>
import { ref } from 'vue';
import Loading from '../widgets/checking_auth.vue'

const loading = ref(false)
const inputs = ref({})
const inputsValidation = ref({})
const invalid = ref('')
const loginBtn = async () => {
  try {
      const response = await axios.post('api/login', {
      email: inputs.value.email,
      password: inputs.value.password
    });
    if(response.status === 200){
      loading.value = true
    }
    
  } catch (error) {
    if(error.response.status === 422){
      inputsValidation.value = error.response.data.errors
      invalid.value = ''
    }
    if(error.response.status === 404){
      invalid.value = error.response.data
      inputsValidation.value = ''
    }
    
  }
}

</script>

<template>
  <Loading v-if="loading"/>
  <div id="login">
    <div class="login-body">
      <div class="form">
        <div class="display1">
          <div class="login-content1">
            <div class="row title">
              <p>Login</p>
              <span>An enjoy life during the time you just saved!</span>
            </div>
            <div class="row mt-5 login-with">
              <div class="col">
                <button class="btn">
                  <span>
                    <img src="/public/image/5296499_fb_facebook_facebook logo_icon.png" width="30px" alt="" />
                    Login with Facebook
                  </span>
                </button>
              </div>
              <div class="col">
                <button class="btn">
                  <span>
                    <img src="/public/image/1920525_gogle_google_logo_network_icon.png" width="30px" alt="" />
                    Login with Goodle
                  </span>
                </button>
              </div>
            </div>

            <div class="row mt-2">
              <form action="" @submit.prevent>
                <div class="invalid text-center">
                  <b>{{ invalid.message }}</b>
                </div>
                <fieldset>
                  <div class="row mt-3">
                    <div class="col">
                      <label for="">Email</label>
                      <input type="text" class="form-control" v-model="inputs.email" />
                      <small v-if="inputsValidation.email">{{ inputsValidation.email[0] }}</small>
                    </div>
                  </div>
                  <div class="row mt-3">
                    <div class="col">
                      <label for="">Password</label>
                      <input type="text" class="form-control" v-model="inputs.password" />
                      <small v-if="inputsValidation.password">{{ inputsValidation.password[0] }}</small>
                    </div>
                  </div>
                  <div class="row m-3 login-btn">
                    <div class="col text-center">
                      <button class="btn btn-info p-2" @click="loginBtn">
                        Login
                      </button>
                    </div>
                  </div>
                  <div class="row mt-3">
                    <div class="col text-center">
                      <span>
                        Don't have account yet?
                        <router-link :to="{ name: 'signup' }">Create an account</router-link>
                      </span>
                    </div>
                  </div>
                </fieldset>
              </form>
            </div>
          </div>
        </div>
        <div class="display2">d</div>
      </div>
    </div>
  </div>
</template>

<style scoped>
/* For large screens (laptops) */
@media screen and (min-width: 769px) {
  #login {
    display: grid;
    justify-content: center;
    align-items: center;
    position: absolute;
    height: 100%;
    width: 100%;
    background-color: rgb(240, 240, 240);
  }



  .form {
    display: flex;
    flex-wrap: wrap;
    box-shadow: 0px 0px 10px 0px gray;
    border-radius: 20px;
  }

  .display1 {
    width: 35rem;
    background-color: white;
    height: 40rem;
    border-top-left-radius: 20px;
    border-bottom-left-radius: 20px;
    padding: 20px;
    display: grid;
    justify-content: center;
    align-items: center;
    margin: auto;
  }

  .display2 {
    width: 35rem;
    height: 40rem;
    background-image: url('/public/image/vintage-typographic-business-banner-design-vector-1581336.avif');
    border-top-right-radius: 20px;
    border-bottom-right-radius: 20px;
    background-position: 50%;
    background-size: cover;
  }

  .title p {
    font-weight: 600;
    font-size: 50px;
  }


  .login-with button {
    padding: 10px;
    background-color: white;
    display: flex;
    align-items: center;
    font-size: 15px;
    border: 1px solid black;
    transition: all linear 0.2s;
  }

  .login-with button:hover {
    border: solid 1px black;
    background: black;
    color: white;
  }

  .login-btn button {
    background-color: rgb(30, 83, 228);
    color: White;
    border: 0;
  }

  .login-btn button:hover {
    background-color: black;
    color: white;
  }
}

/* For small screens (phones) */
@media screen and (max-width: 1116px) {
  #login {
    display: grid;
    justify-content: center;
    align-items: center;
    position: absolute;
    height: 100%;
    width: 100%;
    background-color: rgb(240, 240, 240);
  }

  .form {
    display: flex;
    flex-wrap: wrap;
    box-shadow: 0px 0px 10px 0px gray;
    border-radius: 20px;
    margin: 20px;
  }

  .display1 {
    max-width: 35rem;
    background-color: white;
    height: auto;
    border-radius: 20px;
    padding: 20px;
    display: grid;
    justify-content: center;
    align-items: center;
    margin: auto;
  }

  .display2 {
    display: none;
  }

  .title p {
    font-weight: 600;
    font-size: 50px;
  }


  .login-with button {
    padding: 10px;
    background-color: white;
    display: flex;
    align-items: center;
    font-size: 15px;
    border: 1px solid black;
    transition: all linear 0.2s;
  }

  .login-with button:hover {
    border: solid 1px black;
    background: black;
    color: white;
  }

  .login-btn button {
    background-color: rgb(30, 83, 228);
    color: White;
    border: 0;
  }

  .login-btn button:hover {
    background-color: black;
    color: white;
  }
}

/* For medium screens (tablets) */
@media screen and (min-width: 601px) and (max-width: 768px) {
  .element {
    /* Apply styles for medium screens */
  }
}
</style>