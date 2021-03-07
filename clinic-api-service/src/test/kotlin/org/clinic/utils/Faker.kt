package org.clinic.utils

import io.github.serpro69.kfaker.Faker
import io.github.serpro69.kfaker.FakerConfig
import io.github.serpro69.kfaker.create
import java.util.Random

const val DEFAULT_SEED = 42L

fun createFaker(seed: Long = DEFAULT_SEED) =
    FakerConfig.builder().create {
        random = Random(seed)
    }.let {
        Faker(it)
    }
