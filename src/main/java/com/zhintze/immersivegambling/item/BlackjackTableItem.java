package com.zhintze.immersivegambling.item;

import net.minecraft.core.BlockPos;
import net.minecraft.core.Direction;
import net.minecraft.world.InteractionResult;
import net.minecraft.world.entity.decoration.ArmorStand;
import net.minecraft.world.item.Item;
import net.minecraft.world.item.context.UseOnContext;
import net.minecraft.world.level.Level;
import net.minecraft.world.phys.Vec3;

public class BlackjackTableItem extends Item {

    public BlackjackTableItem(Properties properties) {
        super(properties);
    }

    @Override
    public InteractionResult useOn(UseOnContext context) {
        Level level = context.getLevel();
        Direction face = context.getClickedFace();

        // Only allow placement on top of blocks
        if (face != Direction.UP) {
            return InteractionResult.PASS;
        }

        BlockPos clickedPos = context.getClickedPos();
        Vec3 spawnVec = Vec3.atBottomCenterOf(clickedPos.above());

        if (!level.isClientSide()) {
            // Server-side: spawn the armor stand
            ArmorStand armorStand = new ArmorStand(level, spawnVec.x, spawnVec.y, spawnVec.z);

            // Set Entity-level properties
            armorStand.setNoGravity(true);
            armorStand.setInvulnerable(true);
            armorStand.setInvisible(true);

            // Set ArmorStand-specific properties (exposed via Access Transformer)
            armorStand.setSmall(true);
            armorStand.setNoBasePlate(true);
            armorStand.disabledSlots = 4144959;

            // Add the tag for datapack detection
            armorStand.addTag("blackjack_table");

            // Set rotation to face away from player
            if (context.getPlayer() != null) {
                armorStand.setYRot(context.getPlayer().getYRot() + 180);
            }

            // Spawn the entity
            level.addFreshEntity(armorStand);

            // Consume the item
            if (context.getPlayer() != null && !context.getPlayer().getAbilities().instabuild) {
                context.getItemInHand().shrink(1);
            }
        }

        return InteractionResult.sidedSuccess(level.isClientSide());
    }
}
