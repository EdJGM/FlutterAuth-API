<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

require '../vendor/autoload.php';
use Firebase\JWT\JWT;
use Firebase\JWT\Key;

class JwtHelper {
    private static $secret_key = 'key';

    public static function generateToken($user) {
        $payload = [
            //'iss' => "http://yourdomain.com",
            'iss' => "http://a.com",
            'iat' => time(),
            'exp' => time() + (60*60*24),
            'data' => [
                'id' => $user['id'],
                'username' => $user['username']
            ]
        ];
        return JWT::encode($payload, self::$secret_key, 'HS256');
    }

    public static function verifyToken($token) {
        try {
            $decoded = JWT::decode($token, new Key(self::$secret_key, 'HS256'));
            return (array) $decoded->data;
        } catch (Exception $e) {
            return false; 
        }
    }
    
}
