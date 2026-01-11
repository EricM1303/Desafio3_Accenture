package features.support.utils;

import com.github.javafaker.Faker;

import java.util.Locale;

public class Utils {

    private static final Faker faker = new Faker(new Locale("pt-BR"));


    // * Gerar um nome completo aleatório
    public static String gerarNome() {
        return faker.name().fullName();
    }

    // Gerar uma senha aleatória cumprindo os requisitos da API
    public static String gerarSenha() {
        return faker.internet().password(
                18,      // mínimo
                25,     // máximo
                true,   // Inserir letras maiúsculas
                true,   // Inserir números
                true    // Inserir caracteres especiais (@, &, ")
        );
    }
}