<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

require 'User.php';
require 'jwt_helper.php';

$user = new User($pdo);

// Registro
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['register'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $email = $_POST['email'];

    if ($user->register($username, $password, $email)) {
        echo json_encode(["message" => "Registro exitoso"]);
    } else {
        echo json_encode(["message" => "Error en el registro"]);
    }
}

// Login
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['login'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $user_data = $user->login($username, $password);

    if ($user_data) {
        $token = JwtHelper::generateToken($user_data);
        echo json_encode(["token" => $token]);
    } else {
        echo json_encode(["message" => "Credenciales inválidas"]);
    }
}
?>
