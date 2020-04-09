<template>
    <section id="login" class="isShake">
        <form>
        <h2>Đăng Nhập</h2>
        <input type="text" v-model="email" placeholder="Email" />
        <input type="password" v-model="pw" placeholder="Password" />
        <button @click.prevent="clickSubmit">Đăng Nhập</button>
        </form>
        </section>
</template>
<style scoped>
body{
		background-color: darkblue;
	  background-size: cover;
		display: flex;
		flex-direction:column;
		justify-content:center;
	  align-items:center;
		color: #fff;
}

section{
	background-color: rgba(0, 0, 0, 0.72);
	width:30%;
	min-height:25%;
	display:flex;
	flex-direction:column;
	margin: 100px auto;
}
form{
	display:flex;
	flex-direction:column;
	padding: 15px; 
}
h2{
	font-family: 'Archivo Black', sans-serif;
	color:#e0dada;
	margin-left:auto;
	margin-right:auto;
}

.info{
	width:100%;
	padding: 1em 5px;
	text-align:center;
	min-height:45px;
	display:flex;
	flex-direction:column;
	justify-content:center;
	align-items:center;
}

.info.error{
	border:1px solid ;
	background-color: #ff3c41;

}
.info p{
	margin:auto;
	padding:5px;
}
.info.good{
	border:1px solid #416d50;
	background-color: #47cf73;
	color:#416d50;
}

input{
	height:35px;
	padding: 5px 5px;
	margin: 10px 0px;
	background-color:#e0dada;
	border:none;
}
button{
	height:40px;
	padding: 5px 5px;
	margin: 10px 0px;
	font-weight:bold;
	background-color:#be5256;
	border:none;
	color:#e0dada;
	cursor:pointer;
	font-size:16px;
}
button:hover{
	background-color:#711f1b;
}

@-webkit-keyframes shake{
	from, to{
		-webkit-transform: translate3d(0, 0, 0);
		transform:translate3d(0,0,0);
	}
	10%,30%,50%,70%,90%{
		-webkit-transform: translate3d(-10px, 0, 0);
		transform:translate3d(-10px,0,0);
	}
	20%,40%,60%,80%{
		-webkit-transform: translate3d(10px, 0, 0);
		transform:translate(10px,0,0);
	}
}

.shake{
	animation-name: shake;
	animation-duration:1s;
	/*animation-fill-mode: both;*/
}

@media screen and (max-width: 780px) {
	section{
		width:90%;
	}
}
</style>
<script>
export default {
    name:'login',
    data() {
        return {
            email:'',
            pw:''
        }
    },
    methods:{
        clickSubmit(){
            var self=this;
            var data={
                email:self.email,
                pw:self.pw
            }
        this.$store.dispatch('handleLogin',data);
        }
    }
}
</script>