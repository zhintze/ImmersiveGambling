package com.zhintze.immersivegambling.jei;

import com.zhintze.immersivegambling.ImmersiveGambling;
import mezz.jei.api.IModPlugin;
import mezz.jei.api.JeiPlugin;
import mezz.jei.api.constants.VanillaTypes;
import mezz.jei.api.registration.IRecipeRegistration;
import mezz.jei.api.runtime.IJeiRuntime;
import net.minecraft.network.chat.Component;
import net.minecraft.resources.ResourceLocation;
import net.minecraft.world.item.ItemStack;

@JeiPlugin
public class ImmersiveGamblingJeiPlugin implements IModPlugin {
    private static final ResourceLocation UID = ResourceLocation.fromNamespaceAndPath(ImmersiveGambling.MODID, "jei_plugin");

    @Override
    public ResourceLocation getPluginUid() {
        return UID;
    }

    @Override
    public void registerRecipes(IRecipeRegistration registration) {
        // Add info pages for the gambling items
        ItemStack slotMachine = new ItemStack(ImmersiveGambling.SLOT_MACHINE.get());
        ItemStack blackjackTable = new ItemStack(ImmersiveGambling.BLACKJACK_TABLE.get());
        ItemStack copperCoin = new ItemStack(ImmersiveGambling.COPPER_COIN.get());
        ItemStack nickelCoin = new ItemStack(ImmersiveGambling.NICKEL_COIN.get());
        ItemStack silverCoin = new ItemStack(ImmersiveGambling.SILVER_COIN.get());

        registration.addIngredientInfo(
                slotMachine,
                VanillaTypes.ITEM_STACK,
                Component.literal("Slot Machine"),
                Component.literal(""),
                Component.literal("Place the Slot Machine on the ground to use it."),
                Component.literal(""),
                Component.literal("Right-click with coins to gamble!"),
                Component.literal(""),
                Component.literal("Win Rates:"),
                Component.literal("- Small Win: 30%"),
                Component.literal("- Medium Win: 10%"),
                Component.literal("- Large Win: 1%"),
                Component.literal("- Jackpot: 0.1%"),
                Component.literal(""),
                Component.literal("Use different coins for multiplied rewards!")
        );

        registration.addIngredientInfo(
                blackjackTable,
                VanillaTypes.ITEM_STACK,
                Component.literal("Blackjack Table"),
                Component.literal(""),
                Component.literal("Place the Blackjack Table on the ground to play."),
                Component.literal(""),
                Component.literal("Try to get as close to 21 as possible without going over!"),
                Component.literal(""),
                Component.literal("Right-click to hit, sneak + right-click to stand.")
        );

        registration.addIngredientInfo(
                copperCoin,
                VanillaTypes.ITEM_STACK,
                Component.literal("Copper Coin"),
                Component.literal(""),
                Component.literal("1x Multiplier"),
                Component.literal(""),
                Component.literal("Use in the Slot Machine for standard rewards."),
                Component.literal(""),
                Component.literal("Mint using the Metal Press with a Coin Mold.")
        );

        registration.addIngredientInfo(
                nickelCoin,
                VanillaTypes.ITEM_STACK,
                Component.literal("Nickel Coin"),
                Component.literal(""),
                Component.literal("2x Multiplier"),
                Component.literal(""),
                Component.literal("Use in the Slot Machine for double rewards!"),
                Component.literal(""),
                Component.literal("Mint using the Metal Press with a Coin Mold.")
        );

        registration.addIngredientInfo(
                silverCoin,
                VanillaTypes.ITEM_STACK,
                Component.literal("Silver Coin"),
                Component.literal(""),
                Component.literal("3x Multiplier"),
                Component.literal(""),
                Component.literal("Use in the Slot Machine for triple rewards!"),
                Component.literal(""),
                Component.literal("Mint using the Metal Press with a Coin Mold.")
        );

        // Tooling info pages
        ItemStack blankMold = new ItemStack(ImmersiveGambling.BLANK_MOLD.get());
        ItemStack copperDie = new ItemStack(ImmersiveGambling.COPPER_COIN_DIE.get());
        ItemStack nickelDie = new ItemStack(ImmersiveGambling.NICKEL_COIN_DIE.get());
        ItemStack silverDie = new ItemStack(ImmersiveGambling.SILVER_COIN_DIE.get());

        registration.addIngredientInfo(
                blankMold,
                VanillaTypes.ITEM_STACK,
                Component.literal("Coin Blank Mold"),
                Component.literal(""),
                Component.literal("Stage 1: Blanking"),
                Component.literal(""),
                Component.literal("Use in the Metal Press to cut coin blanks from metal ingots."),
                Component.literal(""),
                Component.literal("1 Ingot = 4 Blanks"),
                Component.literal(""),
                Component.literal("Craft with slag and treated wood.")
        );

        registration.addIngredientInfo(
                copperDie,
                VanillaTypes.ITEM_STACK,
                Component.literal("Copper Coin Die"),
                Component.literal(""),
                Component.literal("Stage 3: Stamping"),
                Component.literal(""),
                Component.literal("Use in the Metal Press to stamp annealed blanks into coins."),
                Component.literal(""),
                Component.literal("Durability: 1000 uses"),
                Component.literal(""),
                Component.literal("Carbon-ceramic die crafted from slag and coal coke.")
        );

        registration.addIngredientInfo(
                nickelDie,
                VanillaTypes.ITEM_STACK,
                Component.literal("Nickel Coin Die"),
                Component.literal(""),
                Component.literal("Stage 3: Stamping"),
                Component.literal(""),
                Component.literal("Use in the Metal Press to stamp annealed blanks into coins."),
                Component.literal(""),
                Component.literal("Durability: 1000 uses"),
                Component.literal(""),
                Component.literal("Lead-damped die for harder nickel blanks.")
        );

        registration.addIngredientInfo(
                silverDie,
                VanillaTypes.ITEM_STACK,
                Component.literal("Silver Coin Die"),
                Component.literal(""),
                Component.literal("Stage 3: Stamping"),
                Component.literal(""),
                Component.literal("Use in the Metal Press to stamp annealed blanks into coins."),
                Component.literal(""),
                Component.literal("Durability: 1000 uses"),
                Component.literal(""),
                Component.literal("Precision die for highest quality coins.")
        );

        // Intermediate items info
        ItemStack copperBlank = new ItemStack(ImmersiveGambling.COPPER_BLANK.get());
        ItemStack annealedCopperBlank = new ItemStack(ImmersiveGambling.ANNEALED_COPPER_BLANK.get());

        registration.addIngredientInfo(
                copperBlank,
                VanillaTypes.ITEM_STACK,
                Component.literal("Copper Blank"),
                Component.literal(""),
                Component.literal("Coin Production Stage 1"),
                Component.literal(""),
                Component.literal("Raw copper disc cut from an ingot."),
                Component.literal(""),
                Component.literal("Next: Anneal in Alloy Kiln with coke dust.")
        );

        registration.addIngredientInfo(
                annealedCopperBlank,
                VanillaTypes.ITEM_STACK,
                Component.literal("Annealed Copper Blank"),
                Component.literal(""),
                Component.literal("Coin Production Stage 2"),
                Component.literal(""),
                Component.literal("Heat-treated blank ready for stamping."),
                Component.literal(""),
                Component.literal("Final: Stamp in Metal Press with die.")
        );
    }

    @Override
    public void onRuntimeAvailable(IJeiRuntime jeiRuntime) {
        // Add the gambling items to the ingredient list so they show up in JEI
        jeiRuntime.getIngredientManager().addIngredientsAtRuntime(
                VanillaTypes.ITEM_STACK,
                java.util.List.of(
                        new ItemStack(ImmersiveGambling.SLOT_MACHINE.get()),
                        new ItemStack(ImmersiveGambling.BLACKJACK_TABLE.get()),
                        new ItemStack(ImmersiveGambling.COPPER_COIN.get()),
                        new ItemStack(ImmersiveGambling.NICKEL_COIN.get()),
                        new ItemStack(ImmersiveGambling.SILVER_COIN.get())
                )
        );
    }
}
