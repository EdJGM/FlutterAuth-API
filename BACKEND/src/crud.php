<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

require 'config.php';
require 'jwt_helper.php';

$headers = getallheaders();
$authHeader = isset($headers['Authorization']) ? $headers['Authorization'] : '';
$token = str_replace('Bearer ', '', $authHeader);

// Verificar el token
$decoded_user = JwtHelper::verifyToken($token);
if (!$decoded_user) {
    echo json_encode(["message" => "Token inválido"]);
    exit;
}

$userId = $decoded_user['id'];

switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':
        // Leer
        $stmt = $pdo->prepare("SELECT id, username, email, created_at FROM users WHERE id = ?");
        $stmt->execute([$userId]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user) {
            echo json_encode($user);
        } else {
            echo json_encode(["message" => "Usuario no encontrado"]);
        }
        break;


    case 'PUT':
        // Actualizar 
        parse_str(file_get_contents("php://input"), $_PUT);
        $username = $_PUT['username'] ?? '';
        $email = $_PUT['email'] ?? '';
        $password = $_PUT['password'] ?? null;

        if (empty($username) || empty($email)) {
            echo json_encode(["message" => "Todos los campos son obligatorios"]);
            exit;
        }

        try {
            if (!empty($password)) {
                $hashedPassword = password_hash($password, PASSWORD_BCRYPT);
                $stmt = $pdo->prepare("UPDATE users SET username = ?, email = ?, password = ? WHERE id = ?");
                $stmt->execute([$username, $email, $hashedPassword, $decoded_user['id']]);
            } else {
                $stmt = $pdo->prepare("UPDATE users SET username = ?, email = ? WHERE id = ?");
                $stmt->execute([$username, $email, $decoded_user['id']]);
            }

            echo json_encode(["message" => "Usuario actualizado correctamente"]);
        } catch (Exception $e) {
            echo json_encode(["message" => "Error al actualizar el usuario", "error" => $e->getMessage()]);
        }

        break;

    case 'DELETE':
        // Eliminar 
        $stmt = $pdo->prepare("DELETE FROM users WHERE id = ?");
        if ($stmt->execute([$userId])) {
            echo json_encode(["message" => "Usuario eliminado con éxito"]);
        } else {
            echo json_encode(["message" => "Error al eliminar el usuario"]);
        }
        break;

    default:
        echo json_encode(["message" => "Método no soportado"]);
        break;
}
