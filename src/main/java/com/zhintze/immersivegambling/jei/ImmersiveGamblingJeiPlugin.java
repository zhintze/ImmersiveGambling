package com.zhintze.immersivegambling.jei;

import com.zhintze.immersivegambling.ImmersiveGambling;
import mezz.jei.api.IModPlugin;
import mezz.jei.api.JeiPlugin;
import mezz.jei.api.constants.VanillaTypes;
import mezz.jei.api.runtime.IJeiRuntime;
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
    public void onRuntimeAvailable(IJeiRuntime jeiRuntime) {
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
